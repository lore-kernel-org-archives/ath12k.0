Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE4DC35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0dOj9OasG6gKfLcIcSynk60sDQkoKoKVnyPghbAjvw=; b=SaHgqotVRyBTLYH2xrGq/JhiR/
	n+TilW5ZptBmlEOzPzbRYyKl5EgeEzolZz8pSDmHG8Weg/FUetoz7q3rTYG/DNQKEsG/zKvi9cFXv
	KLr5LA+Ffj0Y6bwCtsMZpAAGeY6Vt4QTY9GIYuiRpr9ATNNyGimrPBSvynbj2c/9K3drL2rwudxhn
	7fOCmSWs6UYWFayLBr4kNU/IDaPXOoRAOLPpJFejTbXM0d2LcSGKrH+w6YZEfe1VBo6NLbcP5CgqM
	HtOmf+EKfy5Ww/yfFKYktglDEhZQKOLfE+u0ml68DBvi08P303/fJxJCxKpCJEp8/GhjgdtNiOvMx
	j1/jYOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turV0-00000008nqh-2mlb
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 11:22:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turUx-00000008nqF-2pXI
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 11:22:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lmba020536
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0dOj9OasG6gKfLcIcSynk60sDQkoKoKVnyPghbAjvw=; b=k0Iq+qFxXEO6zeAH
	xvrnbFAMBnTZ+mZFOiFhSuzOCeEDrO8UzKKBhbAgTGkxQ5ENyE9BEpXmk4RVV4ns
	NNoCLRBVKY0stkKl82Ylmq4Kc8IUomQm4PdrDWNY3luuNu42rGQw3f6q6eu1e6y2
	2/3PP0vZXSbnmz+xUWq9kWfY7E7do8ICq+svKLmuoV3Gyr3mD9MbR8NCJLTcDZzR
	sZU1JbF5Kh/vargUZK15AKVhSRAQ/CQUPOKeHup2+6b5Do4MUoUn/eBgCaH+fugy
	uIBoSIqEwbQy1Fix9UZjUTQGc5M9XbbeDuuutqntHe48NvIyrrUIkkZlg89/zotW
	Rj9j7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwtbht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:22:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso112075156d6.1
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 04:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383329; x=1742988129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0dOj9OasG6gKfLcIcSynk60sDQkoKoKVnyPghbAjvw=;
        b=CNBAn3NMrTvQ+DMm+BGK/kzLQtnmHg6X0D2dz/3Zb7i/i+m2cpRKkVxvY5CIpPFRYn
         qXXzfG1rYShsGJrV3FpKw9FvzTIqKZPwZo9cFq9WstOp6uNznT92LlCAU0ertxRi8igl
         zexLgvmH/lR/osPSm/T5RCRDUExZF771sdQzIuWKOZLyBqw7CRpgpIFx9dspIRCaeVge
         ortSJcWl6OxTdTm4QXUFxsfRWqLRVTxsBiSu0CY8iU9uxxneY3Yi6/KT6Rg0JgCo5fKb
         VvcPKaYTBXpyylrJF0XkrpNy3OudHWZFZkZl4GGOSk89VBIrmzCB4HUyfjCeS06TqcVJ
         mrHA==
X-Forwarded-Encrypted: i=1; AJvYcCXTQZmTgyQUmf+RbiKVbBp5nIpf9lZnd1fyFKLi3iutVRwnor6DTd6xSw2CCEYgeJD60ok4Ucw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTsLIibXZOHGVdefDr39TgVRr5aLx+J9lNFyLMBYlrL4OJxZc
	y/3Khb6QIZCGtd7YjDTop08+b1Xzht1MzuVLfhiDhBWmut81E+8UbAlU4+7V4n1py0rvB0tPxIb
	7pWGZHS4QjLZsFcgqM3z6grZBva+l5J2R0ozQOc5ByzpL0hcwE3ZFPSk/izcE
X-Gm-Gg: ASbGnctDxwv4DQmmeJSujYW4l9ohn0UVMEhBqvL0MtUeg4+COrr+mDuzhF0q9up0lLH
	itJvkU6F3RWDvZ6mfue4YICKCOf16iNJyFTmf7jiGIvmxbn6odjMKdT76q9LssozskfUXnzn1hb
	mMBGX7HrDUxTZ24gJH/eFlIlecSwewnmQOrR5fp9oiRxgOEbtuZUjbuDEzdC9e/FKGY+8Sw2bAd
	lqbDS7CGiuEWSBVwzjAGKadggVId7O+21h0UosmPFi81uygJoktxiQ+i25CqgDVrgejuDkNAnhd
	em384SDQLS0OV0QsVV0dnYmFW5nuwusvAEJ0fb3+M7IY98ZmUsYC2Ce6gm71Pvk64hzll+ET4nl
	l664=
X-Received: by 2002:a05:6214:f04:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6eb293a85d3mr38241546d6.15.1742383329586;
        Wed, 19 Mar 2025 04:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCw1YsChezouQrX0CQTaQf7FoaYQwINmikZafgVoFKKRYnvBgLn+4C+qNfNmpsI3oGmG0vVQ==
X-Received: by 2002:a05:6214:f04:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6eb293a85d3mr38240976d6.15.1742383329114;
        Wed, 19 Mar 2025 04:22:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c3d7dsm1923219e87.102.2025.03.19.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:22:07 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:22:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <ybhc2ogdrbzadqzukupqqd2mnouuy7ggjifnpecu4ydnktgwe3@iwahgjhydhyo>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <6717d816-02b3-4d27-848b-620398808076@linaro.org>
 <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
 <89a71ef3-518e-4a69-b959-5bd03f0624d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89a71ef3-518e-4a69-b959-5bd03f0624d5@kernel.org>
X-Proofpoint-ORIG-GUID: nMje8kbc8CHjSar_-Dn8pb8KmKmGbvBk
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67daa8e2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Ea8lILSLKeBfcNHBp3oA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nMje8kbc8CHjSar_-Dn8pb8KmKmGbvBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_042211_836431_6FB62C69 
X-CRM114-Status: GOOD (  34.32  )
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

On Wed, Mar 19, 2025 at 11:33:41AM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2025 11:18, Dmitry Baryshkov wrote:
> > On Wed, Mar 19, 2025 at 11:00:34AM +0100, neil.armstrong@linaro.org wrote:
> >> Hi,
> >>
> >> On 19/03/2025 10:46, Baochen Qiang wrote:
> >>>
> >>>
> >>> On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> >>>> Hi,
> >>>>
> >>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> >>>>>
> >>>>>
> >>>>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> >>>>>> On 18/03/2025 17:35, Jeff Johnson wrote:
> >>>>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> >>>>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> >>>>>>>> single_chip_mlo_supp")
> >>>>>>>> the line:
> >>>>>>>>      ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> >>>>>>>> was incorrectly updated to:
> >>>>>>>>      ab->single_chip_mlo_supp = false;
> >>>>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> >>>>>>>>
> >>>>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> >>>>>>>> crashes on driver initialization with:
> >>>>>>>>    ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> >>>>>>>>    ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> >>>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> >>>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> >>>
> >>> this FW version is not upstream yet, why are you testing with it?
> >>
> >> I was not aware the driver supported only a small subset of firmwares.
> > 
> > Yes, this has been communicated by Kalle (and now by Jeff) for ages:
> > using any firmware outside of linux-firmware is not supported, unless
> > you have been explicitly told to use a particular binary. Firmware
> > coming from the Android / Mobile might use different knobs and have
> > different expectations regarding driver behaviour.
> Sure, fine, but that's not what is happening here. Look at the replies
> from Qualcomm - not responding to actual issue here but instantly
> rejecting a patch for regression just on basis of:
> 
> 1. "series under internal review to address MLO issues"
> 2. "when all the necessary driver changes
> (in development, public posting in near future)"

These two are invalid, I agree here.

> 3. "Generally we only support upstrmea driver + upstream FW."

This one is valid. Different firmware versions have different behaviour.
Android drivers, WIP drivers, etc. might have different behaviour, which
works with a particular firmware build. Upstream driver is not expected
to work with those firmware builds. At Linaro we have had these kind of
issues and the response from Kalle has always been the same: use the
supported firmware if you are reporting issues.

> Instead of talking about actual problem, I see only avoidance of
> responsibility and just sticking to whatever they have planned internally.
> 
> That's not how work with upstream is done and is really disappointing to
> see.
>
> Remember Tuxedo computers folks who said we want to control usptream
> process, thus we will release source code under incompatible license to
> prohibit community from working on their own.
> 
> This is the same Qualcomm behavior.

It's a different story. If the commit in question has caused driver
issues (e.g. kernel crash), it would have been a valid issue. It causes
an issue in the firmware, which is not supported. If I were working on
ath drivers, asking to reproduce the issue with the supported firmware
would be one of the first items.

First reponses are disappointing, I agree.

-- 
With best wishes
Dmitry

