Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A7C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkiG74NfSKDDISSpDipBXrovEe/p+kaap4nyJ1TG+cA=; b=OU2K5NWqnL6vhgSmMPtglVtmHJ
	g3TfqTou0i+LO6VExuWfTOzWBOjXgpywFQqIyP5zkOFeHyLxN0IrKET1T8j+4aV4Y6V4bqeWhUcz6
	1esCRXmbh0CsB+WxQecvKqivbrFi+euMJAeYwRv5G3kQwz0z59xD339erdm8QxbddkFRLFce1Jjjv
	PTVfmReHqqv4AwJEN23RM6Kjer3juLidCorH8jqIqCBDHX6etPFRk7qdTOrn2u6bKW7oedbzs7MFL
	Bek2ZlqRTUAB4WiXWau5y2c09lIyryexuUlqamhtxbPEmrz3oLaU/2yTDTqjrpRBQkXOmKPbA5/Zr
	g/Vywc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Uc-00000008Rko-4AuC;
	Wed, 29 Jul 2026 15:46:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ua-00000008Rim-41zM
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2Sel2591746
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkiG74NfSKDDISSpDipBXrovEe/p+kaap4nyJ1TG+cA=; b=gK99+UQDWTjZgXYZ
	up+sA7gb+Amk0AL3BctnPCn52mjpRPnV6G9wurg/r0OMjO14eztpbp7ZbQ27xP9j
	vM8T7ead5sBqaInGl/+wWh74m5Xr/pSJS8gUtchOPP/ZC7d/6dCWPJAmiVmIXDw3
	S06QkybCSetUbGFDMS0xE48PE5vwoXuS7gnyFWv6Rm8JJ2G+sWzCe/pnthWIpkZT
	1eO9eySUPFqO0+yhNzfN9bn0qmGiCPb9i9p+DvQ9YoHZ2+MB+RmKpyvYDRDbG+9t
	fXmabDsO8gar+8g5GcJESg5NCuwrcKI59oKFeV+maL3iI0PY4I8RpohChnaEqtHe
	3ttVtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08eum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso18650165ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340008; x=1785944808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkiG74NfSKDDISSpDipBXrovEe/p+kaap4nyJ1TG+cA=;
        b=FTkprXKtOdMvOGQ04wiMtCUW2KCAwqI2Q9LWxekiaeu/tmOcvhROgmoYU6Dc+mzu0y
         CMWTOB7fkdYwyJzGfo/4L76hFXqFpDllOeOJyHwN4j8sndvmo8p1EEGQ1bm9x6/xQWPy
         SvT6h9wxYdCvwNjAWajQ7Z8txZ5JVMv5dbC8NTThvvcVM1RThIHF+4RjUGPK2VsPrgNc
         XeUF8/bHG4pJvH63hdXeES6uqXRsNR1l7j16GiJipYFsMaUiF6MqpNP9wP5PdBbMZneR
         bBOuhCrVHUt8xdHTAMEl9eE1OznlGFFDnjernI5ja//Ro8J+0cXR+5TznLAWU4vOy6SP
         +Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340008; x=1785944808;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkiG74NfSKDDISSpDipBXrovEe/p+kaap4nyJ1TG+cA=;
        b=GiLpozD48VhJGotC1wx3RANN55Yb5anivmKysb9g/T4cq5GtUC6GXseVe6a1PL7Zny
         ebuLtaTw2FeB80eDyWA0krcPUcMnH11f3rJbcJxHMNn7DcWgJciqVeZwwi+nhaqIHX8B
         8zE3msAr8exTIkcb6fUKVj7x/7yjDcDO01L3I4jZOff37/9vH682+WAH4qAKhZ4GsnnV
         ypK1DrOcSkmqQL/3oigv0wgIfXT6b3mkyyrTtjKD/cVte0usy7TXuvzsW/vCRtekwihK
         okWb4Tdn+s2RaWsc1tmzH4CEbJ2+67rU7E2H5RwQzZNneJH+GyW28Lvi437Ir6gA5vfb
         p+2w==
X-Gm-Message-State: AOJu0YzOqsk0vfKuiNNSuNrxhsc1lN0yNFbdy7HblVMrvMcot0aQx0qc
	z+x/+I1dTlCqoxUeU41EEGh4PAKnUSgf9NlNLNjThN2UebzWffTyk2i5xULin2xbdohX8cVLbAj
	txkWc1mifHhtT7t+pFoii35UYJd4v5NoygAstRK/H4gZGBaHRgnHBIrbftA4be3nS
X-Gm-Gg: AR+sD103wPvy2qVrVtZAaJwNBQDG2BGC1MZg0leR3uNFP/pjRLDnhPB7cdpbXe7gnA5
	kTl8HE+Itj5kEDbntcUQG3zlPCe0iKQFYsxACL1eIBQuPB66SVmGQ4KeOXY74mDH9szd+8gjQAY
	tuBEkEa4sCtgWf6nZgJ05Z37/VtQu3z8dP4yi7Rualxr/TomHKvFoYCDJlSB3pAjEk4xv0X7Jcg
	cavJql0EikTFq8FNLBs5a8iKM/7pylGTBQqy/thP3AqUNg8Z8ov0KRvRhngEotSAaQVO6FLjn1S
	Imxpk7Ikgr4CIhdioLoDyE68otFh4op+/34ZNn3m5Ob/chptuG81n6B6GWpV8cIlsvtGhsDhRLI
	9P1jrNpL5EtaAN4xCOzE6vWUrGsZFD+x0jV9swSC088V06Sezk+S9ZhQ=
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr80489845ad.7.1785340007908;
        Wed, 29 Jul 2026 08:46:47 -0700 (PDT)
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr80489575ad.7.1785340007498;
        Wed, 29 Jul 2026 08:46:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
References: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Use different RX release ring
 sizes as per memory profiles
Message-Id: <178534000498.2826154.2195115585246629060.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX7Sb1+TZFGyaE
 EnaLzuBjGYVtlWE9ZPYaI0iRAl5KzL4tjIEaiReBbpVfgmNnSgZYQFykTciZUE+AgdG6JxnLJfR
 PHtr+eg7E3R6VcqV/X67onjP6zQbDgw0T+xsEIh9l8HW/+eTGlHGR82J9PMMS7+LScgQ1AW6WWf
 m1qkHVmOfbPiPdEqbgtLlBNcTO/jdG8aPVptsaDVi76nRzuz4x1X8G1iwQE7MgJBHu+1Nn60G2w
 Jo1SAiLfabayYzPD/7+6Aa1KAKfbHtGSBKU0yiGzrvFGg0s6RbRmYoqyLS+wQGgD0eV6bqTBObp
 jtlo6XngdyZY6R53QoUmdyyxzpmTsDSDIdkcoQOatL3NqDUMeQjOn66peBvtuvbRZnLObm/s45p
 fr1SNhln8MFRAkvz26T+RnEWBEOzRViTG/7oCIm9u1O7tdFpF5/F07Fc6ehxKUN/Py9Ya1VRC+T
 cgWm4sSNLdpvtCPkVuA==
X-Proofpoint-GUID: HSwm5zjdUhRx9GgAhvDnIG-3kkcTx-Ek
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfXxQqEvORMEM7D
 +ePBb32g4CUNC8jlnnplsSZBQwKosRxD4fjm2MMhM9xPedkmpp4il63VSMQoE4eZNAiAlgrt7DS
 ilASHIhxJMQU55HTDKs2cZ10bIT0Glo=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a2068 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2nvQBFXYXNaE2xgrtYAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: HSwm5zjdUhRx9GgAhvDnIG-3kkcTx-Ek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084649_027662_4392BD59 
X-CRM114-Status: UNSURE (   9.81  )
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


On Tue, 21 Jul 2026 16:34:59 +0530, Pavankumar Nandeshwar wrote:
> Currently, the RX release ring size is hardcoded to 1024 entries via
> DP_RX_RELEASE_RING_SIZE. This value was sufficient for older generations,
> but is not adequate for Wi-Fi 7 scenarios with higher aggregation,
> parallel processing, and increased likelihood of error bursts.
> 
> In Wi-Fi 7, a PPDU can carry up to 1024 MPDUs and each MPDU may contain
> multiple MSDUs. In error scenarios such as REO out-of-order (OOR) events,
> a large number of MSDUs can be pushed to the RX release ring in a short
> duration. With multiple PPDUs being processed in parallel (e.g. multi-core
> or MLO scenarios), this can lead to significant bursts of descriptors.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Use different RX release ring sizes as per memory profiles
      commit: 534459ac562b207ba1a9bb2c95dba77b5939e2da

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


