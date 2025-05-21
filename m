Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B6C3DA6D
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 01:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaT6xZyO950kgkaXNXF52TNliKhXmdLc9rkjyu3RYts=; b=3V97+MvecxPF+iM8MN635GXilY
	cWKdGKXo6s+bVjfaDIYBHMpdFB8oe0MZLfP3hsBswnTf2qe+2yScHvqfcf9fHnD6fN3nRBfYyrahV
	3eUQuky25U1l6nnDJ/hFwkizM0Kpt/Tm8wK9NyFx9kkzOP+FktZSRiIawpI3U3+nddldfmMV+PHIZ
	S3MO8YvIuYQqHHcd/rKevChlpmewzt1wECKDPc30cZeez9kTfYb7qJL7enAkPVPDok4AbJtaUEW8z
	aRGjjwSwEm2qUCYux4t33OxB8c/Ofbdhwg9JHx3LvvKsU2vebpN8bodFzaNQsVZIZ39o5zD4B+xUQ
	IT5nBUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXxb-0000000ETLr-3W22;
	Wed, 21 May 2025 01:09:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXxZ-0000000ETLC-2MQb
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 01:09:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeEOt026994
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 01:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaT6xZyO950kgkaXNXF52TNliKhXmdLc9rkjyu3RYts=; b=ckI00LhOX0cK3dY9
	b4FNeKjWtd9xvm+T7WU1YVh6oDFt3NR0n2WKk3I8p8CboZC2sjmi2Ezv1YfjbKdz
	cNjzObGMj/q4yLZTIcyJg7zBIgK6XSH+sFY9DhadgcP8ZbhKJxLLkF68OVZPHn6C
	RmAfXHgNQniHcR84g6dguuS7Xpzl4LqJ4ZIyO9otdR2ymkgrpdJmg9Q5US9iuJy7
	iY7o/53G6fOzGxafv577iUzLhEqagW50oTVeie1ijoPonAfYusVpOX/b06O7Hewe
	C+aYqx3Yl2sZBHWCQ4YeJ3DGQ8s6ppGb0zWeQVZkF6QRS6hyIJfwKuWGCOalshHc
	xZbcQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf991q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 01:09:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e8aec4689so5166796a91.0
        for <ath12k@lists.infradead.org>; Tue, 20 May 2025 18:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789766; x=1748394566;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaT6xZyO950kgkaXNXF52TNliKhXmdLc9rkjyu3RYts=;
        b=QQMUynyqiI7oXYaEHEZEbr/4/oz4zwDuJBsJBcNb3yNgoaNVkhCKNC7+oVwjNCO3gC
         ca/AgvPwTafkZEHTcC1/S/kEfLmaXy1BGO1Oto2XfkKYq6pE3eS9dU8IuU9sCq3rQWb5
         8M31S2ZaUGjJs51EHHr4x9djdsx7EWbLaV3HZengHFLD8Xa+6DfgCZ/T9NgK7WJSvrAw
         O2RGFMWH77LsXlA0stZtS2qWbV9AW2XOTu11h5/58npSFrLvW6a96J1iLCwIrkIZWoV9
         sx4YpeuB6n2HthGRRI6U4ZNFneeoo7JjSiHsWgcoof2Zvl7jJ79lUPuKmR1TTNDfHr70
         cmdA==
X-Forwarded-Encrypted: i=1; AJvYcCXdb8Tj8d9CLaumjhuwNUGjHFalfgTErfNFDpY6e7XAWN6HPT5XwQxPXSzrLFqMC/yBe4DKJ7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhRutQstKvEfacJYUKEi8C84f6im39WFTomTbs8b9qbz7roAZn
	5NEjOvJYNYI1PQa+PBP2JN2L9iw5iRHd+OUO1XL40xFQkIHIDGmUKFvs2/17hQTBdZVlhw3Jzqz
	c0FwM8HiDB9WkLloeqgWjJTiTmGzh03m+pjGZfHpVzps/pW8ROEfKMk81xh/yjiXR
X-Gm-Gg: ASbGncv2gdoBlWhgN7iDpsKgF5PXUc2BpqxDRfW/sPosjae5ca85tj4MwfxpVCs3ZDT
	x/9KrphgL9GKNMBaqzViKBBqjqLMJOSM/CRUdruttFoetgzPD4QgE1QrHy54uEjF1edMCUgCsXs
	+rErPfQn5Vzb+UtKTJXZNZjwrOb82jLQSCGK6WRPG1KiVOMbxtkZOCE7W/9eN4mfpQ1BekRSptm
	pqpnENQ8WHEPAlFND2hXIVCBzx9XuHHINH1JA+wyqTLzlNs4plj4LsyDGv7sJo1hqE6ckMl3tdG
	0s5rG/h3XltquA0WkZIlXvTEQiLQMZZ037gfIreGX7zx0dFF
X-Received: by 2002:a17:90b:3c8f:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30e7d52048amr31951840a91.14.1747789765873;
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaFYN4qvdiell6xoFLx3FyM9ID3J/mSxWme5ysSundkz5Ss1pJh6M1JGbCKY2LzNGlWgsQJg==
X-Received: by 2002:a17:90b:3c8f:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30e7d52048amr31951799a91.14.1747789765458;
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368bb0sm2423125a91.10.2025.05.20.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
References: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix mac pdev frequency range
 update
Message-Id: <174778976472.4010925.9446734669090977256.b4-ty@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:09:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: _s0ncMyJ6Hq13OnMu486xGLhY_NPWMdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxMCBTYWx0ZWRfX/QYf8uMf4Gnr
 Uawm8YBqH+HIBNQnFkuQiW/XNujzyi5MO7L2kWeH6g7+cIbdxc5muHgpBp6qIwthptjysNHM9dQ
 7kFrXS5f0U+86mOqmGw86pANEw/SLQa62gtq9bbRIxNedATLd0UZUTYOfs/lx8f6m4fXBnJ7xQ2
 RmahMUxXzSSAlLA1yZ2/Rka6O4xDa0ohw7BXic1w+/1eEgZTlYRCiOliDb58Nbk37eEJnNZMN1R
 KoQTljbyqt+Yk7dv6Nv+ZoNx2ZHjs/9iPx6r815bHqhlK8lhafljfNfA03zDHwCjYjE7S1ds9i6
 XTEThR96cwuFS9zxK0R+y2em8A54V6+xlDS6fdVd9/RxV4G9DbrdsFKhl11NUL7zbjlw5MkHHia
 68NNYsInmqXLW7JdsoG+g3csP/XNy2RZRlTebKCI2R3thCIGdmhL1JlPohzk14rb/FqgAnuO
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682d27c7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VeykXRrYc7WjYsKDlBgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _s0ncMyJ6Hq13OnMu486xGLhY_NPWMdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=947 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_180929_787611_BB72632B 
X-CRM114-Status: GOOD (  12.26  )
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


On Tue, 20 May 2025 10:06:52 +0530, Aditya Kumar Singh wrote:
> The current implementation of per-pdev frequency range updates assumes that
> each pdev supports only a single band. As a result in ath12k_regd_update(),
> bands are handled using an if-else structure, which limits updates to only
> one of the band per pdev. This assumption does not hold for all chipsets.
> For example, the WCN7850 supports multiple bands within a single pdev.
> 
> Hence to accommodate such cases, update the logic to account for all band
> cases by handling each band in a separate if conditions instead of the
> previous if-else structure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix mac pdev frequency range update
      commit: 0d777aa2ca77584b339ce195db86fe0ee7dda5d5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


