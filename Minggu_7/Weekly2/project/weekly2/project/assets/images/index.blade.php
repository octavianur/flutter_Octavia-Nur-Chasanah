@extends('layouts.guest')

@section('section-guest')
<div class="container-fluid hero-container overflow-hidden">
    <div class="row">
        <div class="col-md-6 mx-4 d-none d-md-block text-center">
            <img src="{{ asset('img/hero.png') }}" alt="Hero Image" class="img-fluid"  height="480">
        </div>
        <div class="col-md-4">
            <div class="hero-text">
                <h1>Mulai Kolaborasi Bersama Influencer Pilihan Anda</h1>
                <p>Kami sangat memahami pentingnya kerjasama dengan influencer yang cocok untuk mengembangkan bisnis Anda, dan itulah alasan mengapa kami hadir di sini.</p>
                <button class="btn btn-primary">Uji Coba Sekarang</button>
            </div>
        </div>
    </div>
</div>

<div class="list-brand">
  <h1>Dipercaya Oleh Brand Ternama</h1>
    <div class="slider">
      <ul class="brands">
        <li class="brand-logo">
          <img src="{{ asset('img/brand1.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand2.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand3.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand4.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand5.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand6.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand7.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand8.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand9.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand10.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand11.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand12.png') }}" width="55px" alt="">
        </li>
        <li class="brand-logo">
          <img src="{{ asset('img/brand13.png') }}" width="55px" alt="">
        </li>
      </ul>
    </div>
</div>

<div class="container-fluid fitur-container">
    <div class="row">
      <div class="col-md-6 text-center">
        <img src="{{ asset('img/fitur1.png') }}" alt="Hero Image" class="img-fluid w-50">
      </div>
      <div class="col-md-4 text-center text-md-start">
        <div class="fitur-text">
          <h1>Create Campaign</h1>
          <p>Anda dapat dengan mudah merencanakan campaign yang Anda butuhkan melalui chat langsung dengan influencer yang dipilih. Dengan menyampaikan judul, deskripsi, kontrak, dan brief yang jelas.</p>
        </div>
      </div>
    </div>
</div>

<div class="container fitur-container">
    <div class="row">
      <div class="col-md-3 d-block d-sm-none">
        <div class="fitur-img">
          <img src="{{ asset('img/fitur2.png') }}" alt="Hero Image" class="img-fluid">
        </div>
      </div>
      <div class="col-md-5 text-center text-md-start">
        <div class="fitur-text">
          <h1>Manage Campaign</h1>
          <p>Anda dapat memastikan bahwa campaign Anda berjalan sesuai rencana, mengidentifikasi dan mengatasi masalah dengan cepat, serta mengambil keputusan yang lebih baik berdasarkan data statistik dan performa campaign.</p>
        </div>
      </div>
      <div class="col-md-2"></div>
      <div class="col-md-3 d-none d-sm-block">
        <div class="fitur-img">
          <img src="{{ asset('img/fitur2.png') }}" alt="Hero Image" class="img-fluid">
        </div>
      </div>
    </div>
</div>

<div class="container-fluid fitur-container">
    <div class="row">
      <div class="col-md-6 d-flex justify-content-center">
        <img src="{{ asset('img/fitur3.png') }}" alt="Hero Image" class="img-fluid w-50">
      </div>
      <div class="col-md-4 text-center text-md-start">
        <div class="fitur-text">
          <h1>Find Influencer</h1>
          <p>Anda dapat dengan mudah menemukan influencer yang memakai audiens yang relevan dengan produk atau layanan Anda, sehingga dapat meningkatkan efektivitas campaign Anda.</p>
        </div>
      </div>
    </div>
</div>

<div class="container fitur-container">
    <div class="row">
      <div class="col-md-6 d-block d-sm-none">
        <div class="fitur-img">
        <img src="{{ asset('img/fitur4.png') }}" alt="Hero Image" class="img-fluid"  width="400">
        </div>
      </div>
      <div class="col-md-5 text-center text-md-start">
          <div class="fitur-text">
            <h1>Influencer Seeding</h1>
            <p>Brand memberikan produk mereka secara gratis kepada influencer, yang kemudian menciptakan konten tentang produk tersebut, seperti video ulasan di media sosial. Brand memperoleh video tersebut tanpa harus membayar komisi kepada influencer.</p>
          </div>
      </div>
      <div class="col-md-2"></div>
      <div class="col-md-3 d-none d-sm-block">
          <div class="fitur-img">
          <img src="{{ asset('img/fitur4.png') }}" alt="Hero Image" class="img-fluid"  width="400">
          </div>
      </div>
    </div>
</div>

<div class="container-fluid fitur-container">
    <div class="row">
      <div class="col-md-6 d-flex justify-content-center">
        <img src="{{ asset('img/fitur5.png') }}" alt="Hero Image" class="img-fluid"  width="400">
      </div>
      <div class="col-md-4 text-center text-md-start">
        <div class="fitur-text">
          <h1>Quality Assurance</h1>
          <p>Anda dapat menerapkan kontrol kualitas terhadap influencer untuk menjaga reputasi merek Anda dan mengurangi risiko. Sehingga memastikan bahwa konten yang dihasilkan atau produk yang diperkenalkan oleh influencer memenuhi standar kualitas yang telah ditetapkan oleh merek Anda.</p>
        </div>
      </div>
    </div>
</div>

<div class="container fitur-container">
    <div class="row">
      <div class="col-md-6 d-block d-sm-none">
        <div class="fitur-img">
          <img src="{{ asset('img/fitur6.png') }}" alt="Hero Image" class="img-fluid"  width="400">
        </div>
      </div>
      <div class="col-md-5 text-center text-md-start">
        <div class="fitur-text">
          <h1>CPM Calculator</h1>
          <p>Anda dapat memasukkan data seperti biaya iklan dan jumlah impresi yang dicapai oleh kampanye iklan Anda, dan alat ini akan menghitung CPM secara otomatis. Hal ini membantu pengiklan dan profesional pemasaran dalam memahami seberapa efisien biaya iklan mereka dalam 	mencapai audiens. </p>
        </div>
      </div>
      <div class="col-md-2"></div>
      <div class="col-md-3 d-none d-sm-block">
        <div class="fitur-img">
          <img src="{{ asset('img/fitur6.png') }}" alt="Hero Image" class="img-fluid"  width="400">
        </div>
      </div>
    </div>
</div>

<div class="container-fluid fitur-container">
    <div class="row">
      <div class="col-md-6 d-flex justify-content-center">
        <img src="{{ asset('img/fitur7.png') }}" alt="Hero Image" class="img-fluid" width="400">
      </div>
      <div class="col-md-4 text-center text-md-start">
        <div class="fitur-text">
          <h1>Measure Result</h1>
          <p>Anda dapat mengukur dan mengevaluasi hasil dari berbagai tindakan atau strategi, seperti kampanye pemasaran, pengembangan produk, atau manajemen bisnis. Sehingga dapat membuat keputusan yang lebih baik berdasarkan fakta dan statistik yang diberikan oleh fitur ini.</p>
        </div>
      </div>
    </div>
</div>

<div class="container-fluid tentang">
    <div class="row">
      <div class="col-md-12 gradasi-section">
        <div class="tulisan-kecil">
          Tentang Influencer
        </div>
        <div class="tulisan-besar">
            Menghubungkan Brand Dengan Influencer
        </div>
          <p class="teks-panjang">
            Kami adalah platform yang menghubungkan merek dan influencer untuk menciptakan kolaborasi yang mengesankan, memberikan nilai tambah, dan mengubah pandangan dunia terhadap influencer marketing. Dengan dukungan kami, Anda dapat menghasilkan kampanye yang luar biasa dan memperkuat jaringan bisnis anda dalam dunia influencer marketing.
          </p>
        </div>
    </div>
</div>

<div class="container pendapat text-center mx-auto">
    <h1 class="title">Pendapat Mereka Tentang  FindFluence</h1>
    <p class="subtitle">Dengan menggunakan Findfluence, mereka mendapatkan pengalaman yang tak terlupakan dalam menemukan <br>influencer.</p>
</div>

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="testimonial">
          <div class="container">
            <div class="row ">
              <div class="col-lg-8 half-item">
                <div class="card-testi mb-3 me-4" style="max-height: 250px;">
                  <div class="row">
                    <div class="img-area">
                      <img src="{{ asset('img/david.png') }}" alt="">
                    </div>
                    <div class="content">
                      <h4>David</h4>
                      <h6>23 Mei 2023</h6>
                    </div>
                      <p>"Aplikasi yang sangat berguna untuk mencari influencer yang sesuai dengan merek kami. Kami sangat puas dengan hasil kerja sama yang kami dapatkan. Terima kasih, Findfluence!"</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-8 half-item">
                  <div class="card-testi mb-3 me-4" style="max-height: 250px;">
                    <div class="row">
                      <div class="img-area">
                        <img src="{{ asset('img/sarah.png') }}" alt="">
                      </div>
                      <div class="content">
                        <h4>Sarah</h4>
                        <h6>23 Mei 2023</h6>
                      </div>
                        <p>L“Sebagai seorang influencer, Findfluence adalah alat yang luar biasa untuk mengelola kampanye dengan merek-merek berbeda. Pengalaman saya dengan aplikasi ini sangat positif.”</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="carousel-item">
        <div class="testimonial">
          <div class="container">
            <div class="row ">
              <div class="col-lg-8 half-item">
                <div class="card-testi mb-3 me-4" style="max-height: 250px;">
                  <div class="row">
                    <div class="img-area">
                      <img src="{{ asset('img/david.png') }}" alt="">
                    </div>
                    <div class="content">
                      <h4>David</h4>
                      <h6>23 Mei 2023</h6>
                    </div>
                      <p>"Aplikasi yang sangat berguna untuk mencari influencer yang sesuai dengan merek kami. Kami sangat puas dengan hasil kerja sama yang kami dapatkan. Terima kasih, Findfluence!"</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-8 half-item">
                  <div class="card-testi mb-3 me-4" style="max-height: 250px;">
                    <div class="row">
                      <div class="img-area">
                        <img src="{{ asset('img/sarah.png') }}" alt="">
                      </div>
                      <div class="content">
                        <h4>Sarah</h4>
                        <h6>23 Mei 2023</h6>
                      </div>
                        <p>L“Sebagai seorang influencer, Findfluence adalah alat yang luar biasa untuk mengelola kampanye dengan merek-merek berbeda. Pengalaman saya dengan aplikasi ini sangat positif.”</p>
                    </div>
                  </div>
                </div>
            </div>
          </div>
      </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>

</div>

<div class="container pricing bg-black text-white mx-auto py-3" style="max-width: 650px; border-radius: 30px; border: 3px solid #96989C;">
  <div class="row">
    <div class="col-6 col-md-6 mx-4">
      <div class="switch">
        <input type="checkbox" name="" id="switcher">
        <label for="switcher"></label>
      </div>
      <p id="priceText">
        <span class="h1 fw-bold">Rp 25 juta</span>
        <small class="text-white">per tahun</small>
      </p>
      <button type="button" class="btn btn-primary px-5  mt-3 mb-5">  Uji Coba 14 Hari  </button>
    </div>

    <div class="col-4 col-md-5">
      <ul class="list-unstyled">
        <li class="fw-bold my-2">Fitur yang Anda dapatkan: </li>
        @for ($i = 0; $i < 5; $i++)
        <li><a href="#" class="text-decoration-none text-white"><img src="{{ asset('img/fitur.png') }}" alt="" width="15" class="me-2">ini adalah fitur</a></li>
        @endfor
      </ul>
    </div>
  </div>
</div>


<div class="container pendapat text-center mx-auto">
    <h1 class="title">Pertanyaan Yang Sering Mereka Tanyakan</h1>
    <p class="subtitle">Kami telah menyusun daftar pertanyaan umum yang sering diajukan oleh pengguna FindFluence. Lihat di bawah untuk<br>menemukan jawaban atas pertanyaan Anda dan mendapatkan informasi yang Anda butuhkan.</p>
</div>

<section id="faq" class="py-5">
    <div class="accordion mx-auto" id="accordionExample" style="max-width: 800px;">
      <div class="card mb-3">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              Apa yang membedakan FindFluence dari platform lainnya?
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <p>FindFluence adalah platform inovatif yang dirancang khusus untuk memenuhi kebutuhan pemasaran influencer baik dari sudut pandang merek maupun influencer. Dengan fitur-fitur canggihnya, Findfluence memberikan solusi yang sangat efektif untuk memfasilitasi kerja sama yang sukses antara merek dan influencer.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="card mb-3">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            Bagaimana cara saya melakukan pemesanan melalui FindFluence?
            </button>
          </h2>
          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <p>FindFluence adalah platform inovatif yang dirancang khusus untuk memenuhi kebutuhan pemasaran influencer baik dari sudut pandang merek maupun influencer. Dengan fitur-fitur canggihnya, Findfluence memberikan solusi yang sangat efektif untuk memfasilitasi kerja sama yang sukses antara merek dan influencer.</p>
            </div>
          </div>
        </div>
    </div>
    <div class="card mb-3">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingThree">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            Apakah FindFluence menyediakan ulasan pengguna?
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <p>FindFluence adalah platform inovatif yang dirancang khusus untuk memenuhi kebutuhan pemasaran influencer baik dari sudut pandang merek maupun influencer. Dengan fitur-fitur canggihnya, Findfluence memberikan solusi yang sangat efektif untuk memfasilitasi kerja sama yang sukses antara merek dan influencer.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="card mb-3">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingFour">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
            Apakah FindFluence menawarkan penawaran khusus atau diskon?
          </button>
        </h2>
        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <p>FindFluence adalah platform inovatif yang dirancang khusus untuk memenuhi kebutuhan pemasaran influencer baik dari sudut pandang merek maupun influencer. Dengan fitur-fitur canggihnya, Findfluence memberikan solusi yang sangat efektif untuk memfasilitasi kerja sama yang sukses antara merek dan influencer.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="card mb-3">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingFive">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
            Bagaimana jika saya membutuhkan bantuan saat melakukan pemesanan?
          </button>
        </h2>
        <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <p>FindFluence adalah platform inovatif yang dirancang khusus untuk memenuhi kebutuhan pemasaran influencer baik dari sudut pandang merek maupun influencer. Dengan fitur-fitur canggihnya, Findfluence memberikan solusi yang sangat efektif untuk memfasilitasi kerja sama yang sukses antara merek dan influencer.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection
