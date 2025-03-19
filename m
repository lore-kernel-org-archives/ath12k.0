Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6666C35FFF
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS2IohkXOLM+bk6KsKvQ6wp0e0hwiR+9qftmMovCgbU=; b=ZKVPb4A4PwovELd4zfHaA0y6ll
	oOF8L/XNwvxlc14DCnxgC+eWobepPijcf1puXxFoAE1H5MbarEEKKj4alUJ/6fCEdgSndYJUU5X9v
	U+cjgKgwPlyzaBgLzLXy1oiN3rMtj2th1IN9GgR6NmYdluKLaTe+QWaQ7Kmg1J4kG698A9mONZVI7
	vxgsiMublGwEaFDNVAAAF8oa16Lkw7oJ6LC+f1eW/whOAoApP2O3VAzAhiW6l6hhQPIOpslHfWyGz
	sAVBu/VT11Bt15KBjc3ucdj/qQL2y4i1SndvcJlum4OKWeeUbvQxAc9s6erylSauQe9VVIBWiKj7h
	ePHqdnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turZX-00000008okH-2PAO
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 11:26:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turYN-00000008oXN-0zLm
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 11:25:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lpFB004571
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RS2IohkXOLM+bk6KsKvQ6wp0e0hwiR+9qftmMovCgbU=; b=AB3dnEeWF6twrfir
	2nMi3tS3MpvC6JjXby39gqnTb5a3lpUqwJrwydoxrSAoldbLKHo3gn6ZR6GGWBQ2
	hm+lSv/pc6K/rUNuhSYGj4vyskKbbfm0nlVbg3zN9BUT4WjuLrrYVil1f1cH+hQ9
	3LNsIGeBx1WjoLVovNdLTpKQKldC/nqB2+c1RCzLHXnZe4fNSmVMgMV1XOtLGAdV
	zcQF/V80WnVoN4B3rN5ABC4CGvFrY7wDoWDhScUCbjJlPEO75EOXpuyX31dFDL7Q
	MIvktjQK6kSc47F7BoEJjE8On6nRfv2K4wsFmq4QjLu4dFPE+6lJYxO7nYb2TiID
	ET14+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx52a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:25:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso1030959885a.1
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383541; x=1742988341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS2IohkXOLM+bk6KsKvQ6wp0e0hwiR+9qftmMovCgbU=;
        b=bp9GO0wo6vnjuNnwZuzD/8aC9pFnAirZ7xbt15hrdt8X7791Q94SnNzrxEU2fLvJNe
         3qjDbtTVC3KnrDN3fYuGkEmoR96oPsYKhe06eyGRXe5C2vro1/kQBanRxjzJhFygPon+
         0C70+yQSi3adxqRxFwgzor54D3y1igR1i0e9q5f9DNlF/cq+JwhmADvIGDU9ur0teg+6
         O7JbK9P0uRAcnU1xJ2tKSQTSqrbrWCcCt1A6EiKZTCrfvCyp/ytZv49atUM4fuuB68lg
         VZ0RWofcX8rGJlESOmVfibwIGS2bMfzreXfcchHjhvEHle5VPpyrHBNdc+S8ozVP9qyG
         tG6g==
X-Forwarded-Encrypted: i=1; AJvYcCXCuzJ/ZtemhaV+tDjqPbAXCnCubQtCu2BOzUGBK+9tOMVoDzdAC/68M3riP4r/PAXG4UCbkyY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRnY/zcgzg+jE8zTsIoq5//sBEcfg/Ai/AKBXVi/zAloYzE3p2
	/K90rMLSiBMGeRzGcZJk13PhjIqcXT4DOmPYfGdxjyiNXPoXR4EuGf5/DlWeTFuK38QPbY+61sY
	yfxdFwz8ExFWS4F1cJulKo3O5kf1rFMOExd/CXqjnUHZpbDunaAAS4yrt7ziv
X-Gm-Gg: ASbGncvjVM8UcIO5L0J7gDOmOXNs4zdwxzB0zXg4NBc4AOZ3FPI0V9JnRcbX2OzpOWs
	ZTNjW+8MAK8MatIow7Q+rFk0RRm1HjiNw8xwH77NZxBGaFn7Gd9tzP0KCCpUg16iOjszIowIimN
	4Oo22MzvIoKTObki10us9UPiYtQQ2jneZWKDTalwV7SPLm9GVutbRYDzf3gUG2QAMAmyvuKMBaJ
	EErgDyLq3/v9z7DYxI4JSe56WW4p8yEuzVIm+irFQ2EEYecXVVQHwwCNsTz9fvx1A/ShL90mskr
	11H9+GlVhogLYYYxUdao6RGQhcHEB9WtAQ8e2ctIZ5whaO8nufMXZoChaJFYbl2bj+ydh+RlAXO
	W7fI=
X-Received: by 2002:a05:620a:24d0:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c5a8476bf8mr297509185a.40.1742383540982;
        Wed, 19 Mar 2025 04:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+M4Ay3bkSSMXAvk42WzvJRZcx+tU6meYqnEdTCmoW6vyM40oF2Y+SAylnNjCfGIzo+ChbQQ==
X-Received: by 2002:a05:620a:24d0:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c5a8476bf8mr297504485a.40.1742383540448;
        Wed, 19 Mar 2025 04:25:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7befe4sm1935244e87.55.2025.03.19.04.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:25:39 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:25:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, neil.armstrong@linaro.org,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <vpumypwwywrxi54z6g6zmcosd4mbw5y33rdex4zdbzsymcww6s@5fsbhdy6vuju>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <91a5a1f7-6eef-4ea0-bcde-350640984a7b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91a5a1f7-6eef-4ea0-bcde-350640984a7b@kernel.org>
X-Proofpoint-ORIG-GUID: hingfEn65w1PM-Z4xK_O3lKqQiSsER5f
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67daa9b6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=aSjWYWIgIm4qcLF7YMcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hingfEn65w1PM-Z4xK_O3lKqQiSsER5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_042543_279567_C4C85509 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, Mar 19, 2025 at 11:29:18AM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2025 10:46, Baochen Qiang wrote:
> > 
> > 
> > On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> >> Hi,
> >>
> >> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> >>>
> >>>
> >>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> >>>> On 18/03/2025 17:35, Jeff Johnson wrote:
> >>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> >>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> >>>>>> single_chip_mlo_supp")
> >>>>>> the line:
> >>>>>>     ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> >>>>>> was incorrectly updated to:
> >>>>>>     ab->single_chip_mlo_supp = false;
> >>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> >>>>>>
> >>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> >>>>>> crashes on driver initialization with:
> >>>>>>   ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> >>>>>>   ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> >>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> >>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> > 
> > this FW version is not upstream yet, why are you testing with it?
> > 
> > Generally we only support upstrmea driver + upstream FW.
> FW does not have to be upstream. We work, here in upstream, with all
> sort of vendors and all sorts of devices, for which vendors might not
> send yet their FW or we are unclear about licensing rules.

If you are working with non-supported firmware, then, basically, you are
on your own. I think you'd get the same response from any other vendor
shipping firmware files. Consider reporting an issue to i915 or amdgpu
driver _and_ stating that you are using some non-standard firmware files
that were not provided to you by the corresponding team.

> Regression is still regression and stop deflecting the discussion -
> third response now! - what you internally want to achieve.
> 
> Upstream does not care about your internal processes.

-- 
With best wishes
Dmitry

