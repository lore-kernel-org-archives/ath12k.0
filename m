Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167E2C35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdswPg3edtdDr+B0eoS9mcUOr9VA6UyNDyGqxsynjgc=; b=XzXlH9/OBt/DTyYUSywDb2G3q7
	MvawLn+JC3q8zd/Jjhhs7QLBagFqvhMQfH+deXT668adHkeeILQlNWEx37GDaX/77NiS9k38/1n1K
	xmyyNv40I+vkqTS9SBPd6at6/wNZb8Z5aSAVdgGop3aOgVCCFqb/pdjRcKCpezsICXnkAuGNHcBUG
	lrXboXwuO+n6c1cnaNP0lvx0If16prt6GpCjD/olWDrbpmmRR8An3LIto4OCvHpY0KjlC6+Pb5doA
	B6mjGTB7aOe1SO28PZAs446kz75KPmfloesNSsv0liK0k58XiiWO1fkKm2IGIIgyOOFkeDOd479HB
	T6wD7yCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turyy-00000008t5s-3VPw
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 11:53:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turxr-00000008syJ-1juh
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 11:52:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lgan013146
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UdswPg3edtdDr+B0eoS9mcUO
	r9VA6UyNDyGqxsynjgc=; b=cvOsdDR6JSP658gpX4Z9l+6ehz4rwF3gCO9c1GLe
	EmUAmN7rk+hSeKd7RTUmne0azQujC0LJtieA6PDc6a1qIWE5aRb/6/UgzBiMbIho
	VLvbPrityiO5+zZzMBXVrt+GUTmXCiOr1yncvH03UlKGblGTVYiDQEc9vsmiLCJy
	PeUzNSbsU2NTEmDOfvUwRKKcoV1z6146zYlRiwGh9E8+ozQ9pyQRaIfrIdtDio7p
	gHgCX5ZkRHSqhZaRbV8MNIWCITN4atOiRHBp9WjUO2N0jrRqlnDRn0AIN1mzz0u7
	og5oILJr6nbR/PyP0pdP0Gxjsw/eSTDTaG6vp8LYbDm5gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtna6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:52:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a71aaf9fso1364803085a.3
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 04:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385121; x=1742989921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdswPg3edtdDr+B0eoS9mcUOr9VA6UyNDyGqxsynjgc=;
        b=dek/2qs4Lgf+3oXFrH355OJfs9Op5Dl2GGw4XScte+r6Znrj4w8M/wC18p5U29Kv4H
         S4XY2HAtv7E15M+q2cbw8rCbCvuViM1kRUNMryS+RxtzsEvsvkw/MkCxURik5DAl3h30
         u9wu3ZhLDREANRfK3s48Szd5PHiAB6mtJW7LeqxLW91gOtS3bPJeOVzHnYbpDzUg7rXL
         +25AUsd1Kms4c1bIRBRozDjQqSdtarftZEd+70CehdFZ9ITj13x9m2yCz9t5bcwQ6nNK
         v++/0Tl81hlU6wip5MxF0yYnJ6jmju/3PycbmTQ+ksZlTRlsXTYS8q4bChuJ+VSN2ul3
         PnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9A2MdXeDMb2y2XmvLwBxbpDJcsGrSG5n98Zoycsh3p8noourX1wV+w8f9x7GBlMocWwl2Y68=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjtlrEbqCcCZA2RwVjI6USsBImkBRmSgjrrZfwnSGqVsLVqb7r
	XHQ9M/NUuBVIM9IiFPaE9Vz3SjU2Jd+4sWBVRG3oMz4gmSm2we7qtp/Emd8x2riWIUr5lu7cMlr
	4Hz1GC8clyQL0qgjPM36icJGi0g4XDHfexocYl9tM+/nc5QamOUrI/phNYZqS
X-Gm-Gg: ASbGncsGq4wS8LrTsee+9s8m2X0hduQ0XetGRgQsghxOQKhYflAOzf/LNLvStiCvt9/
	OwAt18g60V1rcCwugo7nsW2sHbzBFCIppti1sH86BwR/wIR0GXm768b2qwfeR5t0/25pldOrbif
	Fd1cItmDDc1h6FrGdWjtX8739c5Q9gb3LrI/FVep2hukYgVoh0owO9OjVIvwJ0+Biim5aadZMhr
	EQqjwpNUhykrjxJZltPNz9xs4Fs1Y7o/EYCrPX4vbdE/6mNDoDvdwadnztD8IaYxlMlo1g8nY2k
	hlUOdzBODoOkg9tT4kQ/6iFkNJMRtK8WP9CKOazXXo1O/54i/Nml6C/xCszfYMc1XCogQDGsGw1
	91AM=
X-Received: by 2002:a05:620a:bca:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c5a83d2cdcmr315464985a.25.1742385121397;
        Wed, 19 Mar 2025 04:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMqIt+ZjjSIzaKVbJahn4BsYCf/9HulpLq8YdRR2+eEPEwKb48mWPQAXNqbJE+LaPyZkeY2g==
X-Received: by 2002:a05:620a:bca:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c5a83d2cdcmr315461585a.25.1742385121051;
        Wed, 19 Mar 2025 04:52:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bef3bsm1985881e87.63.2025.03.19.04.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:52:00 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:51:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
X-Proofpoint-GUID: x4HoLcRktWfIOvJ1HPei9L3JNSLemLRl
X-Proofpoint-ORIG-GUID: x4HoLcRktWfIOvJ1HPei9L3JNSLemLRl
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67daafe2 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=wx4mV0efHSwu5DqQRKkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_045203_459108_158842AC 
X-CRM114-Status: GOOD (  25.47  )
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

On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
> > On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> > > > > > ---
> > > > > > base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> > > > > > change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
> > > > > > 
> > > > > > Best regards,
> > > > > 
> > > > > NAK since this will break QCN
> > > > > There is a series under internal review to address MLO issues for WCN chipsets
> > > > 
> > > > ???
> > > > 
> > > > The original commit is wrong, this fixes the conversion, nothing else.
> > > 
> > > Nope. Driver changes to enable MLO with WCN chipset are not there yet.
> > > Setting the mlo capability flag without having required driver changes
> > > for WCN chipset will likely result in firmware crash. So the recommendation
> > > is to enable MLO (in WCN) only when all the necessary driver changes
> > > (in development, public posting in near future) are in place.
> > Really, these are your answers? There is regression and first reply is
> > upstream should wait for whatever you do internally. Second answer is
> > the same - public posting in near future?
> > 
> 
> May be I was not clear in my response. I was not telling MLO bug fixes were
> in the development. Actually the MLO feature itself is not enabled
> yet with WCN chip sets. Any code changes enabling it without full feature
> support would result in firmware crashes with the existing firmware binaries
> available in upstream.

Is there an undocumented change of the behaviour in the commit
46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
single_chip_mlo_supp")?

-- 
With best wishes
Dmitry

