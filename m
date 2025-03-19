Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28137C36000
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbvkYFpqev3zR4mtvpBcUC207wPCz5TpxzDYSvZSuRo=; b=ePCQpkEhe9yWL2PhpCAYnjcfLD
	dc6OALGHGat0IO9fjwsChO+IDvmj3lI4WwV9fu+6ySx5HWhsJHwjQ8KIcBC4rmVU3EMWMAhbuAxHI
	epsRi05n/z+zBJ5tltRKyNAKjDO+kk8B0RHMHipH83ub3THiUBEnvIJHlQD48pDVJaWhM19bdHU/0
	FrY3GHvZTvNkHUXQWyONr1BEzjFAhIoSvI2jMz7M1g0WzRrljplXnUwElXk2UBk1iUGN+CERhV9cb
	639NH28/TiNZWtByZfL4w6ApPfe0LiDWj6ItQ9tXAiCWFP6NSIwXPI4gALMhd4wDHdSr6Q11vN/T6
	kn7lIE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqaW-00000008eUX-3XJn
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 10:23:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqaC-00000008eRY-0amG
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 10:23:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lxIU019770
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 10:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FbvkYFpqev3zR4mtvpBcUC20
	7wPCz5TpxzDYSvZSuRo=; b=gFWaDTFqIWcPzjjOEMtFya7SL5DioFx/8nOxN0iY
	DxPSUB2KvROBciRS1PSD7/PNS+yS1P2KNLHDtF1l4++UZbtIXiPPltB4drBo10JM
	b+JLjbI/dRqjfScNU6TLuqnu9gudowux6o1bNr0k32ljnnhzqzpp131S/VCoTE6e
	5UCx/3RVioY6wpM/fKdvjXfIUiHx2cJWg8rcTD73b3fHYS3z4s87fkfGpsjRYVsa
	yTgb29v4Af8zWFEonO6oazG16JVOHkbyCEucjG54fYBzSETsg2xXs3mgf7UBcplv
	9Rk0h8iRPdVfnD0RYJ8TrcUGNbNpu7MWMXWtZcLhF97vaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu37gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 10:23:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240a7aceeaso112151595ad.0
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 03:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379808; x=1742984608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbvkYFpqev3zR4mtvpBcUC207wPCz5TpxzDYSvZSuRo=;
        b=A6JxPLFXS+w1Jzi2yhJRhcCMf8NE5k9udW+HpGixWWOqkmnqASklzgDNJGqz+hk7nc
         aehvS3zNGE4zb8e7ifyglbm/qZrE71NrVnPC0/27DoPEADvOF8OovT9j/F+a5WZeKLrG
         iC5i1bG/eSko+06H3L4qNM46bHnA0YQ9AwN6t0UtEh+vXjCCOCL+s1C9J65Kwb5J/Jr1
         0pRskb60mUXZNuJgkTS7xlQuOUHVAipMCnlnXXIdMOxOXEC6wJFVvArYHl5D1L1xcEl0
         IMU5521oDyyTqOclPnZU4NHKPeMhnFDgQ74uz35sbaUtsIBP3ObNBVPYID0shUE834aG
         Edtw==
X-Forwarded-Encrypted: i=1; AJvYcCUYGZFuQ+EQS8l2taJaVJbXmi7TKeWHRsmZL3nbKKgsBCykII3x8MHg8yOrgKu1RcWCgfjOylA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqwVDGLXkVY+zIbpv3c09HAQPuElU46z3hpotDMbRR9r5g67JX
	lY+0lPb51i1eWNpwcs84CHIZxOyec7JrV/9gFzS/wcyiRswUsTcmyKL/hzwJU6vO7cGVQfccaF1
	1GAyJk2SceWcGX5P3PlsAyWRsdE4tFZzWiC6QNADDxL6KYreEO5YVus8IufoGfuPiYfgpuzE1Sl
	1INrJ/GEAd1pufTZhSGmUlouF37eLlaPq2ax2ztIpj070=
X-Gm-Gg: ASbGncuERyGhBFSV0r6TxpiZFkUcV73yNmKn+C/8mDWAG2WQBoQJJndwrJ427qUxKuU
	ZHhmo2NK1TL/SzoW/kjSCDysPtorBOmfX7L7wu+53d/c20fpbC5v3ZufCgqQZkEOp++XcRJ7tqQ
	sXoqmXmUjwz+k=
X-Received: by 2002:a17:903:166c:b0:224:160d:3f5b with SMTP id d9443c01a7336-22649cbb880mr30970725ad.49.1742379808217;
        Wed, 19 Mar 2025 03:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ5IO1S/i46Bu67ToV8tPzQkrYZ6vx48Ae2+DaEwRE8G4v0xNRcDqUmYlsrikLoLVDh79+3MWtYXE5aWjM1LU=
X-Received: by 2002:a17:903:166c:b0:224:160d:3f5b with SMTP id
 d9443c01a7336-22649cbb880mr30970475ad.49.1742379807863; Wed, 19 Mar 2025
 03:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com> <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com> <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com> <6717d816-02b3-4d27-848b-620398808076@linaro.org>
 <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp> <42932860-dd78-4eed-b8ba-6eca1c7099ef@linaro.org>
In-Reply-To: <42932860-dd78-4eed-b8ba-6eca1c7099ef@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 12:23:15 +0200
X-Gm-Features: AQ5f1JqmByGfz39h-H891_Zdju3wuL1SK8KDux6sJpLamAM2Aa7rzwvzmoWajiY
Message-ID: <CAO9ioeUuRL6z1DmCoefNU8-Q2xQXwHVVppt6Yo7w2ko-YW8ypw@mail.gmail.com>
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: neil.armstrong@linaro.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67da9b21 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=gvejlOHYFDooY2tF6NUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rXmQG97uzTf0AnhRJP-iaE1Vh-MgFgBM
X-Proofpoint-ORIG-GUID: rXmQG97uzTf0AnhRJP-iaE1Vh-MgFgBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032332_358569_167B2170 
X-CRM114-Status: GOOD (  24.51  )
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

On Wed, 19 Mar 2025 at 12:22, <neil.armstrong@linaro.org> wrote:
>
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
> >>>>>>>>       ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> >>>>>>>> was incorrectly updated to:
> >>>>>>>>       ab->single_chip_mlo_supp = false;
> >>>>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> >>>>>>>>
> >>>>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> >>>>>>>> crashes on driver initialization with:
> >>>>>>>>     ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> >>>>>>>>     ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
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
> >
>
> The patch remain valid nevertheless, the 46d16f7e1d14 changeset remains
> bogus and needs to be fixed whatever the firmware version or ongoing work
> to fix MLO in the future.

Maybe. I'm not discussing the patch validity, I barely wanted to point
out the firmware requirements.

-- 
With best wishes
Dmitry

