Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4FECAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLDrKlFQ+TyQOjCDaTNIvkV0oUkgBFPymnp+deo0dNw=; b=2gccuC0PdtlMTQGUYCl11+qIQi
	tmNW1DmUbaZtLWqeZEqsZOAg2DrVE0XBh1FUxibrXHEedfkCxfu7PGsld8bs0peneoE3UDgfWhRhX
	H8XQCXeJv9f0PpIwM5JnDugqmYD7zITv/DOmUW3kOrvqBZWiX0BO3MZx7ZpJMm+QcjV8oV2U1kFRx
	6ejminiAOlNBOPSRoTsi4xRGRggem8hwNKh2DK7GtQXmBmAu+VJYKxDYlZsQPPJupE7DyHS4IejzB
	BLa9gyNdERh1CBEhVPcC0+r4XqjkFzUTEpqza1EyMhfmtZN9G/m0+Ehyln9OpwD2574RllvhAqqAD
	SnAPIT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLW-00000001Rjf-2qL0;
	Thu, 18 Sep 2025 23:47:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLT-00000001Rhw-2dC5
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IILQZb018272
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLDrKlFQ+TyQOjCDaTNIvkV0oUkgBFPymnp+deo0dNw=; b=ADzNdYSN8RLPCcdD
	B5kCrmrqnuQqUWi++ZZN1eby5awGlOWD3XqW0abC1ffuangQnvN7d7jYEJpIZ23b
	WQK+W2a6NyNpN/RjxSRDSBjduW0jjoa2TWFUY1gJgWOJpoI9Mk0aNAxF5hWNz4km
	VmhugCJPDSqnJgOJ5G4jW18wo8U/aomK6Fdn4fIaJO75fjsPiyc8uTyKj5Y/K3Ss
	E/BPocum5EPWK5rqaMOP/IXhJv1yaedqtGaut2tgZplFZaofUHrLTotjKYBvYg2B
	g7P/h7bbRQg7EUvD5kZ5/3ieDIUcYdIrhc/NX1LYPJ5YgFWwkhhXyIg98LliEYE9
	VIzVqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwgcc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-268149e1c28so17024325ad.1
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239240; x=1758844040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLDrKlFQ+TyQOjCDaTNIvkV0oUkgBFPymnp+deo0dNw=;
        b=sPnd9SRCQUpv2jqZt3FnAbexpjWPeaojgNEnQqEt09XyasKEMtwYkLSPKcaVqsWkdK
         TLLWQJqu3zs1+E0dfB0GGGu051ZqDmMKmo70kGv8eBM/ydeyAbhqX5yyaJ+6FgyDPUJK
         KX/827C4z1Ma4yGY5Y7G7kzyaqwCC9mJEPwdOH4FMyFVwzE4yoh5X+a6/sl8U7klQ8yd
         sENo9eUSsgci0Yj96hhCRHR0ttGgtKwvN2apnkMjrFcI/ZGwuv1pHY/ucdcllwxNRRNM
         6f5ezk3rbkEGyNEUjRbNi+KJ1nH17SnmabhbRUcqdKDOb3D9zF2Q1za3PTAULW34u/uh
         qRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKiXNoAGkPpc5tJAAYtK2MaFxz3UizUqKb+QSXCXt3I3M4D9+xiVS7FHMX6mwFawa0aTEt9iI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsHGBa01MKuG6SFwhs7wKIbOK2TvkPGuelDn5qT0dqxy9ngKb
	SDFgl+lPHg27eCEunLKtANKh5Un5DG1qBxmfJVTwDrZJNqy9mzt2jrU1sQxcu1TZFIOaRv4cQsK
	BRuXOp4IGyIsZW4LkT9X+241sAMO6ye0Ev8BbFDSk8sVsRPGnCj/do6fb/n1l9xvmhLTWIbu+
X-Gm-Gg: ASbGncv1cHBf5261kjjS4Ty+qSSyNVtjtiW4LfxVIswaKuD4ndu+dDB+iP814oemuii
	oRfXHgJgidPvS4azqLFbcup0YfAXQsfZhTxqbG523AgPjw9fjMZmcMOvReYjZg3/D3R87Lz6qDd
	9Sq5onrUYwccXIddCeQy0jEh4ovDzzi3Pyh/TYMshCFiGWF9Oj5tsSYpRSFUHQJttmFrf5NaUQ6
	dii22s31tB0eUMcI9/82huBaHhKXno5jpaTCst+umUWHRaXt/k6bGs1zV3BDppMyWOol+v05RuQ
	vGn4Br3O2Z8X4oYrD3c3RNCqS7Cicx4+T5mcVzCZj7oeWnMJIF0gAhvo0zQKriQov+AODj1GP7V
	E
X-Received: by 2002:a17:902:db05:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-269ba476d87mr19514395ad.24.1758239240293;
        Thu, 18 Sep 2025 16:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD9ekDQzPxbJSmIN93i1sbgAAD3PPG0qDLK6MmIW/8S8pKCsKu6izoBYxkpA5iLsl7JaGyZg==
X-Received: by 2002:a17:902:db05:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-269ba476d87mr19514155ad.24.1758239239836;
        Thu, 18 Sep 2025 16:47:19 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:19 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix 2 instances of Smatch
 warnings
Message-Id: <175823923890.3217488.17674946008340249630.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc9a09 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3oxmQQPd3Vm5LX_vkI8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8NNQiy4t+zGF
 fdFy3umNSPdQb+YHXDTtKs/n2YJmBsWZm5SskGV/yDVrSBsppDYKeDxvPdTVevr77GT1ZlbN9vK
 3Q6Ehg9nvnaQ8fUnHQPfjBARUAXEIoi5upRg80rr0F17rmzWnmycWTi9ZeXq/XLQGiRDTDWo0iU
 H7LdRPNsTa1Y74575dGgRPLlaueXFiTqNuo/dbQwDopV9tjzN4/uOJe7pZ8/hdBCFqikmMjeNvt
 DVBbt6imNzuGhGnXs8t9+22zIs0zEvyH0CKFq87KKkZ14EOIaSD0Mmc751sAQYEMFMBpQKhqi0j
 zBIn4NzWH/ZHFhAX0e4zFRdgXRf10QkR6UGtuyjShlQ1HlwDIfM43jvhvR+SbSe6tZI4IBYwyDS
 S8C+jNXy
X-Proofpoint-GUID: JuVOTBNxmhE0Wv6t0s69qxje7Cf8ZNoE
X-Proofpoint-ORIG-GUID: JuVOTBNxmhE0Wv6t0s69qxje7Cf8ZNoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164723_672246_2D8A48C7 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Mon, 04 Aug 2025 11:03:09 +0800, Baochen Qiang wrote:
> Fix below two Smatch warnings:
> 
> 1#
> drivers/net/wireless/ath/ath12k/mac.c:10069
> ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> 2#
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: initialize eirp_power before use
      commit: bba2f9faf41ee9607c78fcd669527b7654543cfe
[2/2] wifi: ath12k: fix overflow warning on num_pwr_levels
      commit: ea2b0af4c9e3f7187b5be4b7fc1511ea239046c0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


