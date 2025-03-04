Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1BEC021B8
	for <ath12k@archiver.kernel.org>; Tue,  4 Mar 2025 20:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzNhBaJRhdX9T9M6TvLdhgrrQqlpW+5PC3DyW/VSNH0=; b=TF2rOSNAJk9S8FO80/qGwjFa35
	AYWzaCkspjoazd0Ps/tiLWisd/VI0dVKpsBiCMLUvYaR0zUCEkjy5uICw9gxe/6079CtfX6P7lzq1
	zKQ35qFfNW775uk03X0Qj8plT3pd9WVNYNKJe4XCEeMl53ybwPmgxsdHcD20pDD5GAJYyMZKNEjCX
	47RpA2+h2dxdP+AVHFHcJD+or+v/iO2EPE6baeNQ0KrmUobeYnejWxK53ODhN54HmIl0JhsFBXCUp
	TgIGPB3z8/c/YqwjxlZuTIXGVscBN+JCbPZkjL5JoSHoRqwQI7ZeikIymci6xZ7t3PoWh0kBIKr8f
	2z0E1v4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYf9-00000006ACg-3xgD
	for ath12k@archiver.kernel.org;
	Tue, 04 Mar 2025 20:14:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWEy-00000005foo-3phI
	for ath12k@lists.infradead.org;
	Tue, 04 Mar 2025 17:39:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AB2GU019820
	for <ath12k@lists.infradead.org>; Tue, 4 Mar 2025 17:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lzNhBaJRhdX9T9M6TvLdhgrrQqlpW+5PC3DyW/VSNH0=; b=ML5EUbOv02uyIcYx
	EtS+Z/+4uq/PF5klQml+rsj6djCrsWdl9K0HcqeZ3ltKFOFwkBPYr8k2s+D4ZXGZ
	S6guY2v7JK06/phQCecR2QJr+Oa/wZQvgJsE/Qs9V2wly0hQ/vYB7PYXzL7Hrdff
	P9PkXD6NQOBGY+4Q2N98gzlAXfWsijZ1REXzeJieFfNxREV7z1/p5C0rJffAJNp3
	O2BlDodXHQNG0czfSnQLb+IkK7V24PynjEfEKcMZra+PqA5YtM10BQpXkHdJsQmF
	+GuScjqmFQMQ+C+UVmvgDv9pdxPrsdqOdasdxZolY8ZsTKgxXjUVQeWQ57BTISkm
	wAoDhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t2pck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 17:39:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22368fafed1so115275335ad.3
        for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 09:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109975; x=1741714775;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzNhBaJRhdX9T9M6TvLdhgrrQqlpW+5PC3DyW/VSNH0=;
        b=wovYCEuXBdsgT7jXRg2RZlLpC8xr/Mn7OEU7CF7mgvn1K+PoJC5HlcRhajekG7EwAP
         sRgUKTM0L68zxpXqzw2gDOSjOcXIFlii2csUTFaDb5zwK71xaUN4HfPg2hJM0Bb9QT/Y
         soz2j2QlqJMF3LPMTBp9uXQw37z/Je3p6NrRYaMO+OMjiIkhEdZI/N+rQ0QP6itmAGex
         mB2DNX4YChzh95dq7r7J+0B4u3OdpGkU/XZztcx1Z6B77M/LbNTlVudGiaxN3b4p97Z+
         3FoqRVPcNWM6QV7bOIayCv5HgVgNTs50of7czQVec5hhY6NRetgSlxKS1T1+Uc+E1nUW
         ODGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFxo22l031IO0d6PLioD1mIjIJw134co6TGazL6WuE5p675YEK5ZRsSCItjLsnJa7mLM5DLWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCRcYgvjbmNpf3w56gOTA8I7Ipz8TW41LH2X6xur9JG2dbR9qY
	HhfqmvOXda1JJVPErcTnOu6zuCxG2uDfbI2wuA8uI++dFbAOFC75WlByFePiBzgls7sF5uayLCK
	EJCFiP9ywovXu3JDgoT5nazPXgcsaK3d0K5yT2kNwNFdxyQfvAS5un0tUiM9oqjO1GwwY
X-Gm-Gg: ASbGncuxVfNMWO91lWSoFWGPKilj6g1LjkH5vZ6A9+hG5IzQ3lqOi3HWvsdRavbtSG7
	0f+1zU0pCrY99sn9IuOLHcnf6nZRxPtampKAYeTsAEFQycWZAAorAVdDMINBkp8S03Sq+AT0HRP
	xFyYutz03E9Ub1Bls58NUE5P6igHVAsXuzlwFVxL8G5uWOCHBjRfwfVoAUmD6fJXBrngzuy/0Gv
	zOq/teJTBLppqCnT+46qv5Gov4kJLgGqz/YfWdauTj0eZ1frs+vJv2qw2WXk1xqxTdhLsUYPkqM
	LQOglx4NdA30IpdvOHqPn7tQYvBrQjViKdq8yoaZl0dqDDGFzKA/XahK//Aq9E+ty3mJLcg=
X-Received: by 2002:a05:6a20:7487:b0:1f3:321b:4f95 with SMTP id adf61e73a8af0-1f3321b5257mr11231336637.34.1741109975350;
        Tue, 04 Mar 2025 09:39:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4ilrvoy58HBAd8NmoEttAzcssRc6/1hOb0Yyi8934R6godAGYMBjjGwKySjA5ICypNEAACg==
X-Received: by 2002:a05:6a20:7487:b0:1f3:321b:4f95 with SMTP id adf61e73a8af0-1f3321b5257mr11231296637.34.1741109974915;
        Tue, 04 Mar 2025 09:39:34 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1f7a6sm10286098a12.30.2025.03.04.09.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:39:34 -0800 (PST)
Message-ID: <9177444b-fcd9-4b44-889c-ba38145aac69@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 09:39:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] wifi: ath12k: fix NULL access in assign channel
 context handler
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
 <20250222151926.379652-8-quic_periyasa@quicinc.com>
 <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tnLIduiz3qHssNcs1QX0AkYWq0Pw2nm-
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c73ad8 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=3-wCbd5yTIyj0ScaWrAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: tnLIduiz3qHssNcs1QX0AkYWq0Pw2nm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_093936_957859_359A1948 
X-CRM114-Status: UNSURE (   9.83  )
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

On 3/4/2025 9:36 AM, Jeff Johnson wrote:
> On 2/22/2025 7:19 AM, Karthikeyan Periyasamy wrote:
>> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
>> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This
> 
> WARNING:TYPO_SPELLING: 'fom' may be misspelled - perhaps 'from'?
> 
>> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
>> access, avoid radio handle access by moving to the hardware debug logging
>> helper function (ath12k_hw_warn).

(hit 'send' too soon -- I'll fix this in 'pending' if there are no other
issues in the series)



