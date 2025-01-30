Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5EDC0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnBnh8T7Kvj357Hv/Lsj7BVV/t4Dy5jgErNn1Lw3hmk=; b=h8q5UdUGHSAri6tOwL9hejuUC8
	jBe3d/6ud2AHsa+hGan3JSx4VpIr00zCM9/km9xY0x4KrR/zUbS/GSQHwawCkeVVV6HG9hTAQAq2o
	QutZyM9xOOikAh0k/FExGawyDQQilTMA9VIf/zWpB85qxMZrlKHrGLS7xNRileQyVwhjY2CVb3O42
	W1yfjw2KsYNV12vlbgYqbH9gagfrPd3YIMyy+gkbA34v8QQwuJXlcaUcrcvNWxmsex8pQAY+gdCaZ
	CPDX6MwZShKIzwnPdVKIrzt0UXPXMji6o3+tV0g6oRK7RhahCnAFBm5L2lCDMNMfwlnBJe2WQUN4c
	M4SVkuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXpM-00000009DRL-3ZOK
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 16:55:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXoP-00000009DMz-0Gij
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 16:54:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9HaSE017970
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 16:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnBnh8T7Kvj357Hv/Lsj7BVV/t4Dy5jgErNn1Lw3hmk=; b=IcKySbEhdjzK8lhL
	CSiJ6FzfBlkJR7xgpGA5oaAciLY285pBjTB95bf44BiZT6B7/vPe5+qBS44DdAcW
	4nnY9MlVRdjkqJBrk5QAhk3ZLNFSrhAKjjZBGxr24QpJUIUD/oiPrCTDPvIcdTjl
	PViKLn4tqGWslAa1cYSsDCPm96yISG+RnW63i0pUSEojq5iO4pXfhIGm/GqEGO0f
	3/+x13Jxptn9bI6siasEyGfwgt2VpX2B00+gKH4nhthO8FULJhazl7syVqPoDCLP
	IUuShty08hEZSW840+1dIIHl2w2iqmzSS5aJNxXt0BMHFSvAwIA3SqDRJivgssr1
	DuYfrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6nt13vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 16:54:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2167141e00eso23836505ad.2
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 08:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738256079; x=1738860879;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnBnh8T7Kvj357Hv/Lsj7BVV/t4Dy5jgErNn1Lw3hmk=;
        b=pUdEBXejPxWozBhfFXk6+E4L3R82gifZFBv/NIKubDFP8cHoxep9l7VqCm6hJ6Ji0q
         BNKz8FLfsvF3lxiKZ0HBQlCIE+wKaV5iv2Xj5EM6gY1UumCTB6mvlAZrWwHOOpoc23bf
         slMkHp1rKHgtqi0X2ukDLfNOQeRtGbCbDQBL5iNshZSzrDOP/I9OO56s5KOe+QgzGaI0
         SDW2z+SD9RxNCg9hPaQ1uBpEH8BzurM0eax2iTxO1Amk4N5Ek5+Qxav1+AOJDTIyoECn
         VkkvnwJBwl7ee9T7mnqdnOZ6cPS1cK6OBWxZg8OqH0BIW10SctX+DJj2RRArbVeNU8U+
         K/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXJI/W7X5WwmQUs2p0eSNY71iWMUkeq/iTB8CerV3OTz+kE/FM/UKpsGzXNKd8VINHeb8Isr/s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKrDFU9OyOOSt6l/K58ZqssHLQIh42maVsu47vW4fjD24UOLu5
	wE4gX4KNlMib/suFPf/QGqEHlH+GLiWJj+yhOAdvZYJPAGIaWUWtTPwWcD6RQwNlft7UMfuQ6qA
	xYr79ZtUTEVC785SDU6SFWpvzbRGBp47M3s01EFYSPjSRZ2x9wdfb3vzg/uKu
X-Gm-Gg: ASbGncuxG1dSa29+n7T/niaF/v4B4fIEcdZkxl0w0Lsn+3vvTeKwirFp+sv7qpjDS8e
	aHnIuwA1tAeyUb3ZynTb7XVBkPXe1DygCxwZK0frOoghxYNON064VtpnAbtPVRhD7TcoIxzhdkl
	RlH3EK/5RYYttpNBtpMNiAJWxPB3zjCHk7PVrzwsD8XvjRqLu12daJpshRvb4MHB6sd/rX85ZA8
	TMv+9ymK0ux/HQwz3vqs75xZ9HzXOjLN7jhoH619NtlmpWfPPM2Z0a56Jy0hn55Zggvn06Wk5fj
	WjPFPGyooD1ACA0OPhCLLugrBH+2qwb2OHMmSz9BOA==
X-Received: by 2002:a17:902:ce09:b0:218:a43c:571e with SMTP id d9443c01a7336-21dd7c67eb1mr139210285ad.28.1738256079472;
        Thu, 30 Jan 2025 08:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3LBhjxvlcwe4lPSze32TiaSAtUucAXpsHRstoSfjnqvgHnk1hjloWbNQmvR5W07cMl9+KHA==
X-Received: by 2002:a17:902:ce09:b0:218:a43c:571e with SMTP id d9443c01a7336-21dd7c67eb1mr139209965ad.28.1738256079068;
        Thu, 30 Jan 2025 08:54:39 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe8566d5sm1382820a12.35.2025.01.30.08.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:54:38 -0800 (PST)
Message-ID: <a307e8f3-e171-40ec-ba50-da9ab90cb824@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 22:24:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath12k: Avoid napi_sync before napi_enable
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
References: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
 <dd37c366-21f5-470b-9d4c-24ae2808c4bd@oss.qualcomm.com>
 <b155f782-feea-4b99-8edd-e499e313294e@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b155f782-feea-4b99-8edd-e499e313294e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rsWHhWsdx7aLju4ApPl8x3wRXsprLYm3
X-Proofpoint-ORIG-GUID: rsWHhWsdx7aLju4ApPl8x3wRXsprLYm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=969 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_085441_118361_390504E7 
X-CRM114-Status: UNSURE (   9.27  )
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

On 1/30/25 20:35, Jeff Johnson wrote:
> On 1/24/2025 8:55 PM, Aditya Kumar Singh wrote:
>> On 1/24/25 14:30, Tamizh Chelvam Raja wrote:
>>> From: Avula Sri Charan<quic_asrichar@quicinc.com>
>>>
>>> In case of MHI error a reset work will be queued
>>> which will try napi_disable after napi_synchronize.
>> nit: always better to refer function name with () at end. I guess Jeff
>> can fix in pending?
> I fixed this, as well as did some other grammar & formatting fixes.
> 
> Please check:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/? 
> h=pending&id=a644c8784220b7d5dd0a10a45c5e6779605778a5

Looks good, thanks.

-- 
Aditya

