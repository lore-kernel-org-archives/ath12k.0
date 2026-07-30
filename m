Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EDCC55160
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bQFu7vP2omksa5AIfbM6+5NRq3Hi2nkVcA8F/PSQEE=; b=GpXKCHqCXFhW7g2rWWuGWvv5sZ
	SZwD52lWhFv6qM2yADCKFpn6pl03RbHMERnxhFWyEGQ4l9DC9/53PIQF0QPXlDB6drkTs+jUa1PJI
	7h54NcOwomen6sAl3YeKwxI6ertMHz3l8huuoFg4w5oG2RWMIc//Ti2WhDrUdg+Ou75n7Arbw1lcZ
	mgoJzW0TVC82MhRCwQRDUGadomQAHSjgnbw2MUPOhTbw1zpDVfIYIB01A2vpVMXDwjruUUUYIjvGa
	s0/kCgCDu8ETEq3wwZSP5N1KyuOa+nuvAWSR3Jx6eX0hK3C68Tb5AorY2zTEDGQMrql2qURQGj81Z
	ij4B0y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpG1p-00000009J0M-1mqW;
	Thu, 30 Jul 2026 01:57:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpG1n-00000009Izt-0UQK
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:57:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U1u6Pp3120258
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bQFu7vP2omksa5AIfbM6+5NRq3Hi2nkVcA8F/PSQEE=; b=mYGUPEHNGNr/lDb/
	1PSaDWMfdEZSd32SRjGKJ2Q3OvTDkEz09frEFmU3f8FrvwMEj50vMTQg8K6z6n0V
	atTDEZ3F9WQrrW5xI+XsSG28U25vvdyCoZlO3+Ad5wXt8Ln53uCGJLr9ieWinboK
	S3mnMzXD2boIumEwSNoIH+6YY3alx3eIay2Fkk7JYLszojDPRfl6BrO2pGq/IrDe
	fkc+E5ZE8jXZTmryhXXUY1hzZ2IV+pJppQmssdfZi9FyTflzTyntVOrBAl8am4jN
	qbrHkWNrarBJh2luKJUPMTAFXBXLBIa/CnaYPdvpHIK7DArKgh8fI3VCbV+E82sG
	T+MLEQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwcsr06t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:57:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e1da97175so2344235b3a.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785376662; x=1785981462; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bQFu7vP2omksa5AIfbM6+5NRq3Hi2nkVcA8F/PSQEE=;
        b=c6aDjVt2I5Ne9WtLjqJesSc+8uTpJ7V5wt8X9wNnKS+15AeeLhdZogB0ATTTNeKnAF
         1RFZ3nkBqz6H0LKT4innMH0dy14qJD057qWb6DPF9iFsHVUdiQTB+OBUyHUVlP+gzBES
         MyXTukY+QDL5HnTuR03432yWb5fKJaYeLzgDYDJReVtK8x3OQqUbY7xFC+cWUbriS88o
         nXBn2xwqoPEqGo4ebi4E8RNn6dt9ciZNAVqIL2ScNvEAHdJF8R0LhjkgRf19j5HIV/e/
         HcugRkAz+2RkLzgqAhbHSo1T4Y+eHzKmwsg887KtYru2ppTLq2NlxJPTVdh3JGU47CDK
         UG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785376662; x=1785981462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bQFu7vP2omksa5AIfbM6+5NRq3Hi2nkVcA8F/PSQEE=;
        b=cCaBVqNJdBJScjuWCMgrlq/v0CNOhWDlX+Ndau8BYbXrA83TMYcYJvrqovygQ1DV8R
         hZ7Xgf6mOtdT4eiYrJLiaVHdLc0vJkPIhH0usuvxBS+58e3d8N2YwN/xCIeoTQvGWnN0
         0albDoY5+diQdMfNn1SFIUiMazQpq5QbOUc6ySw1m3kMFj9pDEq+2PRcq4glUqKogGtZ
         BqXmIPk2Zhb98S3PUKXevoSdUDcPAV5h4T9YaqVGa5LZrnWNZm6TsKCEMvlZ2B9FZ3g1
         oybre8+CQD51orBkhZNkBvxQ+S8MGgI9fNicQVRwrojvUUyw8h2rBXHGeJEpQx4hW9x9
         MIQA==
X-Forwarded-Encrypted: i=1; AHgh+RqWJCW+pAi8B7EEoCJL0baAkNtdovxzIqEH6V45D/BPeLyAAnFhZGTtnMwPT9i1nclemJmZRZA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywof4lhTVX7ON1aoqf0V1zJ9dr+s6iUohk77Lezgp8Pho04/ZFl
	RC9bAyIayBWrdFS8l+XcUE6k1zw+EQ89jblPp7YyBs49qIyN7v5fKwmg0rKTF0uWfRXbsVJCcWa
	OXD34X/5cuwIGCPD+N//Yq5BAegnKEe1MszOPRMJuxEA7W8/BrT1bJetSMo6gd1wA
X-Gm-Gg: AR+sD12ziL1CHBYDvfnJFaKVI/o6c9IcNkgRbnhHdkEyGx/42LDu4P9j6iUzx2n+ogT
	yyLUVo1GyBNyh/V9FfNn3cTZ2iizfA5tIqlVq053Bc9fNT0sw5YE3rKdOWlKOXupvnFkY9fZwsH
	CBizmnHWkwhO8c6Zu7x7KxJeeggSpeNXKyh2avKqDbjLpJ9kS7udsHQXE3w3KSeFmfatgt3IEPQ
	zsipnnJeBsKAClcn0GeJMdyz595y44Lh4k1odegbLiJqJXmg3LSw5sqZHDSDdItY0kBtHcPSngT
	plL5zcA3GVX9o43r8F6dWNQnZ4hj92ykFAKnvIVJDQUMfKx2Xa72TQY7hli3GVVWTRKilW4nQYB
	Y844Znsh0jRl8d7q+w/LF+B1Tf2NXdfZimFk4mXKYYp4UTKw5xzy1fyFR86iqSvXlLdvhkTWGsQ
	==
X-Received: by 2002:a05:6a00:2185:b0:848:2f7a:2e5e with SMTP id d2e1a72fcca58-84ebc466080mr702581b3a.77.1785376661810;
        Wed, 29 Jul 2026 18:57:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2185:b0:848:2f7a:2e5e with SMTP id d2e1a72fcca58-84ebc466080mr702564b3a.77.1785376661438;
        Wed, 29 Jul 2026 18:57:41 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm2099431b3a.35.2026.07.29.18.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 18:57:40 -0700 (PDT)
Message-ID: <7c3d5a9c-7e9c-4d59-9932-86d05312e26a@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:57:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNNykuvH c=1 sm=1 tr=0 ts=6a6aaf96 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XimLFvTEBuXuzLDNtLAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Nh-p6-ysb39_uI5-JL0lUdvkdlZFKRLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfX/7PjbmO47PLM
 YMp8ww4+qnPJzaflonvISswlXMqaUf571ndun9GMafirg6flLWlOq5/Ut1tGSa6s5AVqQ76pc4s
 OYTHX0Pfc+2utoTrQhkqdAXLBuh10duBrajMcd8TnIlA3R3ix+x0tP1n/xNqhLmyUkI73OXP8fa
 JcrYHbN3WMURXjXujPha943zlEZ4NoUdi6J1k6UBBy9vmK7wxmN/sq4688AsWqd8tbY3sncyfFa
 r2epGXEyfXkvl0rEzYYBCNTPwmrovWP3c7FVf16/OoiHzhYePeqNSIeJWF6il5FRpqowsiRMYHV
 k+64B4jl8XI2TiM7XMKNvTQhnLNpFucuJVv4VCL5CZ/Lq/C2GbPUfRK4pe3gs35CRex+nY9F9bx
 PAGlWUZ3wO0YUdFA4olqRSuv7uqS5cVOu8oDsWBLVcSumRjH9txaNPPknfgt5NNDX0ZoJJq2pcD
 8APQh/Uh0SSzssvwl4w==
X-Proofpoint-ORIG-GUID: Nh-p6-ysb39_uI5-JL0lUdvkdlZFKRLq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfX7vSUKs8nSMwX
 Ehq32Z6AxWERZkLvO1sxmE5W2nP0Wxqv/cyskVCfxKXIodyw2g/1X6SV+bKBCKo8gigJtqm6sCz
 H6sxjQS5u0pA+PdeBEx2XXwO7IMBCKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_185743_174263_35D6C954 
X-CRM114-Status: GOOD (  12.15  )
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



On 7/30/2026 1:17 AM, Reshma Immaculate Rajkumar wrote:
> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
> 
> Unencrypted EAPOL frames used during the initial 4-way
> handshake are already handled through the existing
> is_diff_encap path. However, EAPOL frames transmitted during
> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
> the normal native-WiFi transmit path.
> 
> Firmware encryption requires RAW frames with cipher-specific IV and ICV
> fields correctly provisioned in the skb. Passing encrypted EAPOL frames
> in native-WiFi format results in incorrect IV provisioning, leading to
> an invalid ICV and frame drop.
> 
> Fix this by detecting the EAPOL frames that need HW encryption and
> converting them to firmware-encrypted RAW frames before transmission.
> Reserve IV space after the MAC header, append ICV space at the tail,
> select the appropriate firmware encryption type and request
> firmware-side encryption.
> 
> Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
> helpers in the TX path to obtain cipher-specific IV and ICV lengths.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d29591d5b52e ("wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

