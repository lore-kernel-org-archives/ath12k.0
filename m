Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF72C021B3
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6t17zJoyzi/MYtv7YnDTb5dXnKB3dpwV2Y+J7LFw/8=; b=YAmSJJJ7nMcczhHQLY2wuAE/+Z
	e+KZxSmTa3Qk2UFu3YwRsmS7uz8cuwhYNpdHdSuEiJyfTVzputb0gk711de8ccW89pPeBnsfNpvdO
	7ql2tv7OvogmKhqgTqIAALAR+FUDdJzHD83wlKnxTklZ37QOBj6mv5u+VA9K7UDY62bay6OIWH7uM
	MDMEBe96qg5lsfmqAvGgm3rk3VoFixc9COCGkjIZGquV/burqF5Sr6cVjQYypibFe/uvvdXOc6b8L
	/i9ZMwIAzYvX496puiK/qb9JFB9wcY60VVYpTFIajLAjPPuVrYReqJw7GPZJYbNQj1MBzGp+6rDHG
	9GLqOdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8nM-00000001fFS-3t4T
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 15:49:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8lR-00000001ebw-0BsX
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 15:47:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7dPRg020390
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 15:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6t17zJoyzi/MYtv7YnDTb5dXnKB3dpwV2Y+J7LFw/8=; b=Q2xTXwhfjSdYxCbI
	a2rq2V2q2zVyg1eSuSD70WMwnkb0VR/3/UIbixENlunH6GD/VHlh3t1yLfbyeEOF
	2QzuWmmxN97rtdE9Z9gqzZ7xFJKDyUxUqIOOOlXKFY0PacwJfJ4A/hDzdOTVeWLT
	MMuDyQb2MMQtBSqNmjrJAM6QHcana+UZ3YYS2ITpYKTav1S1XzwzPPAJGnXHTwar
	W5rIiFU1nG0fuege4HvXvT9Vj1vFe1/cQoj51kzRxH7iAYloR2zhyrBFChldUbxi
	8lkkKLMC/iJgkcuajnFxu8O10/QunuyEFa+f1mm600pcxOtaHiqLO7b7DS/OSuMA
	oAItCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t1a7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 15:47:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220e7d654acso27850505ad.0
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 07:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066419; x=1740671219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6t17zJoyzi/MYtv7YnDTb5dXnKB3dpwV2Y+J7LFw/8=;
        b=h0iUzL3ggpxfqse89BZEa3teqIyBTvTyCGO0z4pPT1DSfiecGP5MjCuaHtIlTAdr2u
         B67b2guEjVfTbe9YC+R42iH/ZKeGL5qPtDwwCStvO6ozBlczWIcpJVZ2C1f9HbTSkuTM
         1G1WZjuLKocUxuZYGD0vSHQdF1l90LygTIIJsepPtHLHFMuYF7qBYLHSP+IVhSp3T7GS
         Q8CyRoAUyeb5JFvishTijR0a/Zox2/6RWTsQwTvgC7K6l6DDf8prdG7uXa2dSdYQaSY9
         avfLB00WWIT6lo7MI2Xds+2Ka2YsXJB74XM3vzGzYGy5lld5km3XVoCGft1S3TwKef+d
         nMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiNlCsBDMxyc6dlRhTeA+HzbDKRp4djMuHE6Jezd3BafOGjayn8PLe42qSULa4hoNxcN1GpW0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw//xP+28G40v9CgJTudMFJSgrUdgY39ARtKXh6cT1O3rpU9Tfo
	6uamt5yvtHQLy8EJGIeZ1hHPMlcZN+oP5QGPGPCrhAJs8zW4QxwlZ3V5e9STbgW0A3Ay6EKoVnz
	vmd0ksqBE+J/ymhjxYYVlFzSP2giKbuXjbHX7JyCubCJU/DfqR68OCfZ6GJpDX3WIuKYl
X-Gm-Gg: ASbGncsHG+/Y9dx0V32Ecp7KlPnavGywKoZAEZOXNw+asw/jmW5W+9sgBb2SOTNh0sy
	JeMiyKvNeUPbGclC/TwfcnNYskKZnV3ZZVhcBX6G4aW6FV7DYBHqMRKqyLRFAlfLLhQF0PpuKXx
	xn7FjqLyMaN5hQeX4D5WjL1k/73Ig6yk94hclt4f3XCNkgwQI8o0czl9b4oypvk9wLB/rpQqRnE
	t03xb3pwwgrSt0K7j22gtCCGZrz6oKoHNmIIbUJCd5zEusJnQuRWu6tcdAJz7/LzqNU/fQm8Po4
	E5OtfB3U3yBJM546fR1gr96bK1br3mJHKNw6wcF/sTN/ytpK07FNk4SWRnh+4dPmzYod9JXQXA=
	=
X-Received: by 2002:a17:903:2301:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2218c546f7amr72253785ad.25.1740066419228;
        Thu, 20 Feb 2025 07:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhZuienlMC+FiI9oeBoMDi4nayiLfAduqOYeqfUcAKqXiHdP5lNX3kFBEMvffwWkdr7b8wxg==
X-Received: by 2002:a17:903:2301:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2218c546f7amr72253415ad.25.1740066418801;
        Thu, 20 Feb 2025 07:46:58 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53643e8sm122730155ad.71.2025.02.20.07.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:46:58 -0800 (PST)
Message-ID: <80a13b18-01f0-4f52-853f-bc8e3f84e91b@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 07:46:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113331.93476-1-nico.escande@gmail.com>
 <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
 <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kk4oxTRgw64b0fuoZ2Ms0K-40I2UMk8z
X-Proofpoint-GUID: Kk4oxTRgw64b0fuoZ2Ms0K-40I2UMk8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_074701_092479_DFAD8460 
X-CRM114-Status: GOOD (  16.90  )
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

On 2/19/2025 10:33 AM, Nicolas Escande wrote:
> On Wed Feb 19, 2025 at 6:58 PM CET, Jeff Johnson wrote:
>>
>> checkpatch complains:
>> WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8a373c8699', maybe rebased or not pulled?
>>
>> And I don't see such a change in kernel.org
>>
>> Perhaps this is an out-of-tree change that should be referenced in a different
>> way?
>>
>> /jeff
> 
> Indeed I didn't realize that was not mainline, but just in our internal tree.
> My bad. Honestly surprised this has never been pushed upstream.
> 
> So the corresponding patch I was refering to is this one:
> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/207-ath11k-Add-support-for-dynamic-vlan.patch
> 
> How would you like to proceed ? I can respin it without this wrong reference if
> need be. But if one of you guys has a better fix or something we can drop it too
> 
> Thanks

Fixed the subject and description in pending, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=e5c718f0c65701ec941ab3121266f33f83ee9803

