Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36E60A6F77
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vPHMZdKu;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m2j+tbF4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=; b=vPHMZdKu3g4ZTcBiCv+PTu6zom
	HRrEz6Xtr+TBm+KfLJuOW23AGa/BCQx9z4SXZRtNnkizM7sL/32UwNMs+k/5qBEQcJfuSFjWsMeoX
	ZsE0o2ydCuliwlzFqAtHOD/8O006T41gqWFtRNJV8YvdXRMInJJHyq5GsVHUjqEmSsrSqhctprWph
	HU9FKka3nukHT9bLIz3D8W2YIBKSzM/BExV/3FJ5dSoDqLf6OZj51gU1vvHappXKq9eEftDDpdUKF
	YIHwKeHxzEeZ4kTj5VSE82JpS14Nsio1J7sc42QPOfEoUivKaLpky1dUZ8poXYfLjptOTe52nQEtV
	5xWFW43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lp-00000005zPi-3jZ4;
	Wed, 11 Nov 2026 08:06:37 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Ln-00000005zLI-1g5M
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c4d21051042so451681266b.0
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384393; x=1794989193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=m2j+tbF4EPe1bAIP3bZmms91KixlFhMh8xHLQX/6aemBycKJ87DgWXTCMG3cpOLZ/U
         JH8XN6dVkpZ/VhjxC86kQc4NiORxVZgLkzyR53pImD32ryrLLIS5Y9erR3EzPAQbtCYW
         DbQJMHAp/BCw2JWfq3f///EDaOXEsxLrJN72eT8RQkcQdzxw0tW5kvxnFCoJax1/aOkb
         Sc/DqkTlAlLkCKEcdoM+qFlr5t99FRr+UZCAktLDKg9g+4yv5Q/TJpMj/RJAG8E+XvSU
         rUm25oKj7EcZUZcWzF57rb9fYwIMhjr38eLmMXkj3JN2XK6EZgovky0/bGl6VGg5q7Nj
         cKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384393; x=1794989193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=quRQ6QX35soXezUfMB33hD6tO1uh2iK2zRBn3nLNPdozBkxey5k7D1cCH/45oEy3vN
         tiCR/xqkzaq9J+POJxtIz7hbDCPm2lvdL0McE2xPOn4V0j7fKeUjLjd6Bdc2qbMHv7xs
         A5uLH3sT6r4d4J9noGXC0yTmcSaWMuRWSrXyoLLnBXJwNaCKAMW0G8vXrMx/w7mIApGy
         WtOOwPkXAfX/PSOB0G5pEATVIpCBYmwsBgNVWVrJrR/61cZhXB+46ltjRZVvMoDfoUs1
         uiSCZa1+3WUliM47/nXzFZhv2BwXmZPRtuV1ZzhK/5u/7yOPvAH0RZAQirkbx9fIzSj5
         J5WA==
X-Forwarded-Encrypted: i=1; AL+hErFNkDmjB2GLExTEEaUc19LYZnSGnN7flGAfo1FEpH1LIeOUXv1s3AipDPdFF4spTMc5OKSmGS4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ukaKyqLfNhGmSv6/+hXAU/Nk6PiGWtBnCwijM41G39/kZdaC4
	G4Nl24bDXEzLHaEhaR2+tW7HPWRLr9UBCPYoFPgxI9SWGfT9Tkrqv6ZbpnGtUCXHqg==
X-Gm-Gg: AYBFou0dDpP/82duEBhTfpVi8ZIo7rdgHHD0xB2ZfvvZIlkDRz0h5Oz3agx2jTW5pv8
	kYY2rvbqWcBLWggGsfzhNE/9zscL0lz/LBLympEPL/9ZYaee1C38g2D3/lMP6kmsywFZClbHNoO
	i6h6OeExWXVakLJsWxUbjhca2RFkl6W7ECvpz84go0PoiFxOV1yPBdIgvOQQ8iakziALtad4z2R
	9bgpiguxFqeiI4fY0dmLflUxpTIvtrP0uzO4cJBzpNi4XsNXZloScZ7fibbThdgauzcZcGfGuzU
	nEAAU7uEVuRTERmnLo4NHwf/v0D7FhPZVoVik1A35z1hoZXoV2cUG5urbzPvpSjcXrlaw9MLRVI
	bw3Gs0TQw5TgjMbmMde/pLSVTnM686m8lPwqSVlnkC3uNbhAzyscE0zVrGpqjtLGUvbWJiNnod6
	Icxgy7vTeSdwet2YHfJ2cup8PwjszHqBrM4WPlMK1bB/5P83SDSS6SJKtIu+d6DDzaW/FmxYXqk
	bqGvo1jIb133AKXhWdpPpupbsHE60V7kZy5w+m3+l3oM1CKKf1eVMElW33hKKHqIEykGYqsypgE
	k19mI0szosAJra13xxTVvIXMdl5/Ih+0MGAbCAb9LzB7R60h5USO359X338RQUZjj0uSvmWvpI8
	IM6imnU0aLnBW267gSS4jdza9qBB0bBXuLFTa+1LZyVW3h4yhc53daw3QyU+y0UbobmvX7MpuWC
	OxBoGjIQiWiqBDHhAxneBnF8umMM4poTHvWLsrpGAWz+B9SsaP4M+lF+sp+j010sGLA++l7o3Rd
	temavQWdF7LXOH8QD3Rz1hwEg1uMRpVNHyAvLuHBj9HQlsPxBfdJvlEHT/T5LVgSTOo5LAqMKEs
	WuroRhaZWRDLYafv2e4=
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c50668b84bemr120721666b.4.1794384393506;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] soc: qcom: qmi, ath11k, ath12k: take WLFW messages only from the firmware
Date: Wed, 11 Nov 2026 09:06:27 +0100
Message-ID: <20261111080630.244427-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000635_457899_F8381F92 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Any local process can open an AF_QIPCRTR socket, send datagrams to the
port of a kernel QMI client and publish a server through the QRTR name
service. The QMI helpers hand responses and indications to a client's
handlers whatever their sender, and ath11k and ath12k connect to any
WLFW server that a lookup reports, including one on the local node.
Both paths reach the REQUEST_MEM indication handlers, which free the DMA
memory that the running firmware writes into.

Patch 1 makes the QMI helpers take responses and indications only from
the servers a client looked up. Patches 2 and 3 make ath11k and ath12k
ignore WLFW servers on the local node, as the firmware serves WLFW from
its own node. Patch 1 does not depend on 2 and 3, which can go through
the ath tree.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (3):
  soc: qcom: qmi: Take responses and indications only from looked-up
    servers
  wifi: ath11k: ignore WLFW servers on the local node
  wifi: ath12k: ignore WLFW servers on the local node

 drivers/net/wireless/ath/ath11k/qmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c |  4 ++++
 drivers/soc/qcom/qmi_interface.c      | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.53.0


