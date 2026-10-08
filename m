Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88823CA6017
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=; b=NRv/1K4Lv0IMnrZLGiYl0rRtVz
	0d6+J2Ub04Rbr092Syi0iqdTFwFLlDRhVA0J8kPOKuGyhtHSGQcnUEZIghdGFn9emsQnW2aq3usMX
	cCDF1VpfyGYTuJEp0iVbHkuwCIYX9iZl4BaljjRfAbB9yh2EI5Cf6NRnbIxMpXXS9QS3urRcZHE7K
	FgIi+zz3QADNgfg7QyNqCYgCVeOEMInPl0k/nzVa539/yCpxb02J1GPiVOIa91xQzk5ZmxGlmbkUg
	lGJTiln8nGOxV2n95cISKT9Ya43UXc7+4d2tLmsUMKOcnZSfFjQeXLPzcS+XVtNjWWBWO7XEGI9zF
	1VXbdolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw8D-000000056QD-0KKy;
	Thu, 08 Oct 2026 21:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw89-000000056P3-41Bh
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 21:58:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0DbF296677
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 21:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTmDvHbME4TFPnudbIvelUAw
	a8csw0mAjHsQ39CULK4=; b=DPwZ89b1oSlNDZlbCEK4iPDSS/zrKliHuZtJtxjB
	z3kmBixlpcCWTTPBLHVyrPrRaHGGhwxTC4HGHiRjSZaRMeK83bNf4/d3vYaLh2QW
	9mRjdIsQNCQsZSgnOUjYtPMH6OweE70WVOi+wSEpBm8kIdV/CRzoMoiaQ102kkPA
	/kK7T9y/Qn7hnLVxNwVjMA8pJOL49ZXQrHLvGMjndb5kxmA/T6K3NA6SAAascDKS
	PRNCrw0LbXnTfAMd8y59yCCeRJpthPE6RnaCGUK2n0tSedUl/pzsVF/7U25OQX9u
	+2d5WLkf+KES/MQYMD7Rzksail5ygHERtleIB9xFMsDHIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekv9481-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 21:58:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so672792485a.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496704; x=1792101504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=dudNndoTAsU8qEtEGWAQdfYT1rLO8XUZlRz3lBInRGB6D/E+c72yiwVqkVwfUxmgVZ
         Jv9VqE5vXob2egxyc6E7EYg/g6D1kzmnK7QSQueMHOmVCPIYyOmKo5BqHfxrk10eZXq1
         16YomDxirQAKnDoRMOvBoQVXnVOT1KtL2RQQwFB8h8gkVgrnvjHFMPEZ7xdqETXZ+afL
         YKJgRPOa6X2JnuKNqZGnaukqJeC+lQqaQDzhN4hp1XtdoX2UHvbnEET0Dtlh9TywVc07
         kH2AknBvEIimr77AONStUK9tujnMLt4U2cP/Xk22ml1vQls/hLslcsIrrzrLoJBH5Rvp
         Iwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496704; x=1792101504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=Wb5zN24AuPnn6g8702BArO3IEc26ZjF/1EzSD9pgPdxP9CWrBlFsNPuQl4PPFqHAYN
         bIc1YAo862HHrBqSHu1DUeIRmEUP2GqdmHkjnn1TM6711jNRjyXOLMLhbyeDKeZxdaqO
         UO+Y9rmGLM8N/EGcq5ghi1SggIWj1dM8VbWbAj1WWfyXo6offl/CWIxoPcZImuOiM1pJ
         Htt/yHDDZfyMrZ7wNroqDvOv9Uw4/0vCOkTuYvKH423MbxdvbPDUmZmZMTeVCqwOiE0S
         BtVMvqf0SBBFKB2hxgU1D4BlacQzE8Me4HqKw+oiRuFrE5omTAK2HvgWLXoIPs7uduEd
         mgcg==
X-Forwarded-Encrypted: i=1; AKwUvBy4Q3pDKQV2FGbhvTDc/tRF5ZCgV9UVMFOzUC/suNzofMPPLKxyeuVoiwRSUkhlB7SaWefKSwc=@lists.infradead.org
X-Gm-Message-State: AFuF++kExCoYUka89p5uRy6jaKSHPpOPCBEsOsD/yEQXVzxKjEnFmYhB
	kN7czFR1PTxoWED2Q8gOJezsbhke+RqMA8TAQAdKlEtfH67Jt5Bd5dm9YvEdsHum18q5RBkMtCF
	eNU+k4sZyeAW+MrGZyM9QrcAzhb6H4RidKa6s1eY4uLMcW/D2tsgfPHy/o+DHPd+O
X-Gm-Gg: AYBFou2sobcYr8PYNNky1gddZbk/fmNUt6QyeNRlCHWd8KmH8u/6SQGWtonAuNAJRf+
	ttNbcXVrq6Y+Hs84AY/NQP0201NArOcMQazOZqjHbXyUz1mngpsu1vHFc82so9BX371uqewERpY
	uoGV9ScPOy1Vx9oPshtXo4sBluo/iElWMjro7w1mPjxXqSuLAI7sBfhebVvCC/+U+yIXtxj3Lrr
	Q+3P2g0sSzrpij0rFTj8+0DrvXv2Y/rVX1VLnLbWpk4ufKr4P1Tbxomi+pNt0UdAVAMS9mW0z7e
	+eCR83bKkYVwRcq5yHkFzqxdnBa9nEfQBIrCgkJPWq6MNu9MrGF85qbZ4i4Ecy/SeR3H9qrU9tQ
	R1R6TjzH5+o157lPRC3A88/Xy58HqeVo0NU5564q1P0C7lGJPNMSiY5JtV4//oWMgUKyo5Y2S0w
	UviqJZCx3mQx5o
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277725185a.58.1791496703718;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277722485a.58.1791496703267;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm102345e87.8.2026.10.08.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:58:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:58:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261008
Message-ID: <afoydvkyh6kc3n55eet6ubszuw6g6q6mwtghfismxxxlvs62dc@cl6zxhem475q>
References: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zJDYR-6vprqFtRCJwF8AIZxWoLp2VJwL
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac81200 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=qDMzh20vGZsPvAqjlPMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX7SH2mNmwgXMT
 Ti2gVq8n/QUIiooZe55Lhq/lHjSBX+Ck/heasGuenBPiTCbQXMaU4huDI+xncaSanATNfFXz4Xm
 T5h/whHElL5aNhg/tb6RJUITYNyA1LlqMjxKlPo2TfkFDJx873FE5C4ka3h4AoiiSN1EDsiQ/HW
 kpzc2iZn3GWixb+U/pnymlycgoIze55uPi++Klha8AY+YE4tqXlV1NnAMXxUy696rPTPNkefiS8
 CggZQvdNgQV5YAmFXLocel3Fe5ZR0U8DuyXj2xohfyahV1flhjevMtqX1enyyIsSLfLJnzgBnnY
 bK0dNbLShscByH9qumy5OYm8fk7xmlmN9lOu8Tj2zx/TSGgml/VFgdlA3m5/3MQ62w2NZqmFf9r
 XxNgq7y3PkxirQ1NwgBZrzSCdt4edrGSQtnp51RhvtHStw2SzMWHK/v9CgJPu4i7dmNbF3KvZ+c
 orPCNWt/WvmKtBA6cgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfXz6HWFbdtTan1
 iF36NwfuusQoa8sBJBcVtYD3+F8KjoPqH55kvV4Hk4719F+I2RQtWwi9B0Np+gtflG11LpUY4mw
 T810WJ8xV4d5QECgPGhCxN9lUbB8la4=
X-Proofpoint-GUID: zJDYR-6vprqFtRCJwF8AIZxWoLp2VJwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_145826_123146_D16F0805 
X-CRM114-Status: GOOD (  12.46  )
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

On Thu, Oct 08, 2026 at 12:58:46PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> For ath10k and ath11k there are no changes.
> 
> For ath12k there is one board update:
> WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1296


-- 
With best wishes
Dmitry

