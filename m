Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B08C3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlubvvj+QDGnJHz9jHk3yA37ZHRIx4oKicrzEoPiFHI=; b=SCrExoZQW9Ip6SUGDcXVxyE97S
	QKFoxsXxnVG4mmCzM3utImeH5kexrftU0gRshd8FSTRJfx9ZW3UlSh+M29VXRTV7Z1IkxuxIyDxQN
	yyp5XlWpuTSok4txwzdHhekgvJOZQbWyKS6wlGNODciOCDijVz3DESjhiNytk324ZgOL3BCkIAgyH
	zMAXyJBzYlyXdY+7J8i0WhZ9mDbokoG7QJlMhQwLuUlEm/Bb+PpIG/PmcpQusymtChaTnTr3KBd4S
	k+kWJPKac0Jk/rDaXdcjE23XWhO4DL08P9PSN+fGl4Rhsubp5PVRuJMsIR5KoRkk4H4eLKqeKrz9Q
	2dk3YM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz39-00000004BpY-3lYP;
	Fri, 16 May 2025 17:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz37-00000004Bnr-1zeo
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 17:40:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRvsv023359
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 17:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlubvvj+QDGnJHz9jHk3yA37ZHRIx4oKicrzEoPiFHI=; b=JwxMplWZArwNgHhG
	7YwqqaVar+OFSV9yZQ7GmB4TQbzkzFhxHkvUlxAukEX5ubywrM2W/zCUrDPiDBVZ
	ZQjURRXjGqLy2OA/woFn0hqMe5lkSGx/E4rFyOXVKDWAxDKakkXI6Ayudb+WHS4i
	CRxZGXU+V59+mnMp2KOKMcpA/KUWvqoXYgC99OmtE5p98gC/6U9/eiwpYtCzUaI7
	W30JH38KHtJuPNBbOe4dDK8pGt3qkC+UHwqGj03vjbGqgISAAa0CRR/L5hhaoYyp
	24R2kVECUe9DFNp9XGpAb8ici3m1UzerQ8A3Wjz7p9tbgRmnkWxKOc/Knx/TRyyP
	JQALAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq9107-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 17:40:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2318043effaso26403605ad.1
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 10:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417244; x=1748022044;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlubvvj+QDGnJHz9jHk3yA37ZHRIx4oKicrzEoPiFHI=;
        b=PxXataP++4LhJxMBHSXQpH6weG9C3pcjFMjg+8KM1Gk9thoqFyr2YfM0gkgvq+qdmQ
         a5Us3CtBh6Fj2J/tlb42Dmr1Ag3H05eoRnC8fZRKhG8zAu/BG7Hnd4GIaObtbsUerN0u
         nJ2vpzy7stXX4bhVXPEqERyuJPh5itggPaS3loQ3fZH8Lk2A27O1RK62EyBzZH/z8mJ3
         ZcmiqC9IHZe9S6WYPdfxONkSsMxb4fv0nWBSzjpU3TmCUL0nqwYM74F5c6lU0Ww0xoVh
         DAi9q8tYyM2LMEMGQ7DoBzS0W7Hl3kssdQeKP49Ojz6PSYQHFai6BRb+T+SEDOUF23YA
         fO5g==
X-Gm-Message-State: AOJu0Yw/6h/fyNQs45EbtYzNYsDmsqJXH0wg3ZLIzJ9RB5FXw3pAGRjh
	7P10ZGD3doAa3A1BqMk8R9Nun2IuMU8S/ENk7C5z+neVb18e9WL9gK1eIvfkmS3bmFWBC46ba7/
	n+lN+mDiWQCMSDywOMt8n54ypVqd44PdbXQQ1Ck5nvc/IxhAND+1FTKk83/JCpsqC
X-Gm-Gg: ASbGncv4hTha7iKxhd4MlWjkckR27ZiIyULkX+1BL+uTYRhdvMMu7TG37GTFtEDkcLN
	MkYT6sfxblSyKNqliEmePghJO7ItxwsvcOkSeg04ufocfK6qCrm+LenHrYOfL+dUUCaMpg+F9tq
	q6ld//H3tIv9iJEhcA0fxOs2vFkYs3a7yW9xHybDUH8E94ZryWRexPrHFz95+KFBo+i2H16mEeb
	jWKDg5f0oip0I1Iwl2J/7L69X05V2tHXP/H+qizpx+Uw6F055xAdl956WSYvM++ToKNli9Pk844
	9uVr7lLhfTfmbSPGYd6Q6btruTHcX98c73qFmS54l/8xH414
X-Received: by 2002:a17:903:2ec3:b0:231:d0dc:f2d4 with SMTP id d9443c01a7336-231d438b4efmr54555465ad.2.1747417244216;
        Fri, 16 May 2025 10:40:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnpX+C79lbNRgRAwyYYSWhQTaoTAtNOQBrn+O1L/WMYLap06IU/0tTdtq79z9bKxFd0l/g3w==
X-Received: by 2002:a17:903:2ec3:b0:231:d0dc:f2d4 with SMTP id d9443c01a7336-231d438b4efmr54555175ad.2.1747417243837;
        Fri, 16 May 2025 10:40:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
References: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: handle scan vdev
 consistently
Message-Id: <174741724241.2935573.13251493111560682392.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: EbXWOk3lGXsHWoLkQf0aeUOKkWNE2mcE
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827789d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VtwFg9zR_83gxYRZV04A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfXzfJef1zVPsWB
 mQwwdkE5rFfIYjzb9a9a1v02btwAndDm/lTbpag3+EB4OgigWxS01tnX8Qul2L8ZMQfRwHD7p8D
 WHtesvXpkWXJk740wddEaIV0IC4bs/IATIDjhYsFGbIz4Fk6hhFNOOusK4GNH+vOK8sivw9vl7G
 x6YplNRLA17eMbkBolVTZj9ZnlRrsAciNPsIim2xx2ly+jnRHxltS2N/BBcFIfEPXWoX9nhBY4f
 N+b6S5qNuT5aPkGFOHYcVvTNmiE8RBOkgSwq/EgvD1TBGl+7PdU0iCqKW6opIhyOs0SPhehjSuu
 3W5jLMPhFTcj+3h8xKw3ylASsPdi/zGjt1hT2c4PDpwskM07+F+aWjCN0nCrp245eUYH2DqxSy1
 +FYy1EkdNMG89jZwnxusWTBtlD9xyothoHys3JxV4iq6oCLVVisFc20YQwx536L3tYSUlW8y
X-Proofpoint-GUID: EbXWOk3lGXsHWoLkQf0aeUOKkWNE2mcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=928 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_104045_525543_AC138808 
X-CRM114-Status: GOOD (  10.22  )
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


On Thu, 17 Apr 2025 11:19:12 +0530, Aditya Kumar Singh wrote:
> This series of patches addresses the handling of scan links in the ath12k
> driver to improve consistency and functionality. The changes ensure that
> link ID 15 is correctly used for scan operations across both ML and non-ML
> interfaces. Additionally, the patches prevent scan failures by fetching
> link_conf only when the link ID is valid and setting appropriate default
> values for scan vdevs.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: handle scan link during vdev create
      commit: 8dc8340c197854bdd7aaa4a1b0f1a75646667596
[2/2] wifi: ath12k: Use scan link ID 15 for all scan operations
      commit: 88c3aaf46ce8878a8314b791b99b8d621f7badeb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


