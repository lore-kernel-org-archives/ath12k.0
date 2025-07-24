Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9E5C87FCA
	for <ath12k@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwzErQioZu9PjMe/wnZaPsi/qS3bBF/GqYaLXaj1NYE=; b=w9sAm1OdoQ5IObGUYFqSImt5po
	40k3PHBowGEgWuO6jpBZuFNIiffizmCnqPS1yYG2MYRqepk4wnz4ILvGhSvn6wOsqiRC0RAV+z2EU
	ww7tgg7lLwHP6kd4Pd9VImPIJ+H46QPuGisyar2W1tRF6oqKIlJPSzdLqR2nlnUO/jIGEvc7o3b0k
	mBDdLt99wuKhgrnyB/cGQl+OCpkewnhohfKXDZEcjKL+wEf6KhU+fdNBWSyzW6vle4+a316fYT7UT
	7QXvVh1DFpGZANcIfue25xCXf19HcqKqg/Pqd3eOY7w9SorspnKIqu/RnvhhaeKm/F8CCKovAWnUa
	RuCGn0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNn-000000083LJ-2a1E;
	Thu, 24 Jul 2025 17:05:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexBW-00000007mLM-1PeQ
	for ath12k@lists.infradead.org;
	Thu, 24 Jul 2025 14:44:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9fjkv010362
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwzErQioZu9PjMe/wnZaPsi/qS3bBF/GqYaLXaj1NYE=; b=iefN6TuzdS8G0OMw
	ego89JXDGCNo94qF0gO59QkZI8E+Fyk5uO6l28aFbXDrZKhyaKa1PP4t0c0ogb/L
	vyvDafjGkVVGCyhLm33GviULeO9C/OPf9k6xsoUqcSAewPbDmkE9ylXNixZ5eVZc
	9HTMGPNp1SPbxkAZE99wOng3WoY0TM9eb/pkwkvRJym2N/ntZhlwZ/CDhHliLah4
	1JqpOnaD4R0gxol3TXczx3UlEKjsNEWF6yR6kcXu85ebMGQlCFACFGKwIyXwtR+8
	MCCqQ5R/vaGLHLF1T9+YUeVo11KSmCjkW024iGgZMUCKUaStATtLNGTArD3C4Mk7
	o1qktA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6wa9np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:44:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso801714a12.3
        for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 07:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368275; x=1753973075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwzErQioZu9PjMe/wnZaPsi/qS3bBF/GqYaLXaj1NYE=;
        b=BNh93m/1KruFpYI/9bkkgjLiLNVKsTTZB8S08RCTaaUW9H9+SAkS5a/QVc4w2g8hdh
         f7ypZwY7h4o2fmcJLhKdNW2iVAIVLjrSEXHAfPZSO6nSwvGrbBDqA89QYECW5bWvPEDY
         Z1s5/fILzzPFNWa61pe/pT5x36cE6VB+lJcEt5m/FwyWbmdcHEOR5y06MTI6EoFVKL4+
         YiV8IpGkVpPr1HqAO4o/XuNUAbvI94Za24RyjkNXj51DFjXSVjzZrU/zqwStGDSeOnlz
         Zls8HqwafhAHgk0QonIvTR02sBuSxWRYdKreyZIKt4frP7/+b5g6t0CvdVhvXfcaOYOc
         AEGA==
X-Forwarded-Encrypted: i=1; AJvYcCViJd0U7KeHYFEjuagEWqJ9ikNTQZAAJwUPeu/v8k9mwSn6Ux/uE1QtsHZucW61wHZ8XorPX54=@lists.infradead.org
X-Gm-Message-State: AOJu0YyebRua0r3rtCGPizgEkgR+C8HqPMRRLWuyEh00APPIJr/4Ah5p
	5NUbZ7jVwyUTmxpXSh5lMUXQhBsN2joThQjpweeC66JSltreKTIAMKqwMiJzAqHZTvWg1UHihem
	4R7FBFfL7qDc2BI2bxiEFTWOWqn/CtYfCEAddOsVwezHBsxbbOH3ySJC7T2P+8G4K
X-Gm-Gg: ASbGncuegTNL/LYvcPBIjcvlhvc/M6iuoxWdidh/IDHhVSYvsJ2p9tTL75a+mrdIVHB
	98zQPXc2fmMkwWbNg1InKwEZN50QW/oSlejU8OLRIiJ3CztUFbfq8e1DQkutVHnpcm3u2uaMZKZ
	RY+Rqul2ribWW1yj853jjN+yImycc1j7eUXoIHMH5j4yEavf7hbUd4+sgRzj5CrLBtSNqtuiX0a
	rNcz4LSpPZNDNwoVjr2ktUl8eFb/Id4aO3iUF5sRfrjIQXjm2vvtv0DmLXkUPidW+nl8lvDi5uA
	NAB22uckeotHtznNR214LeJexR+JbNClSLHQpcDeFgnaPgVsPch9K1JhLA8pSlQAXiDTbztBtyL
	bQhdX9yIsAKXe
X-Received: by 2002:a05:6a20:6a04:b0:20a:bde0:beb9 with SMTP id adf61e73a8af0-23d48fad420mr11333808637.1.1753368275507;
        Thu, 24 Jul 2025 07:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQOrMTwwzN5SF29A4r3KiC/tGD4pAdUICJFLJoLiMcgay7qH2V4ueKJZw6tBpSm2mEBFj9bA==
X-Received: by 2002:a05:6a20:6a04:b0:20a:bde0:beb9 with SMTP id adf61e73a8af0-23d48fad420mr11333777637.1.1753368275042;
        Thu, 24 Jul 2025 07:44:35 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.197.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b04b350bsm1848119b3a.67.2025.07.24.07.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:44:34 -0700 (PDT)
Message-ID: <4ac18b01-96b5-240a-d098-ffdace7a4a73@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:14:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: monitor mode fixes
Content-Language: en-US
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=688246d4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=CkStrBlBBtcNoDngQR/Gdw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OnG7L_fJdXhSwPoSXesA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMiBTYWx0ZWRfXyklZrCTnZ8cn
 YkYkxJ8gQ1QyvvY5bdu3i5IBp59wKe6K2cUwnZ10PeK6yY51uhoOcUNnYs+Y5UUALS7f9fVeemV
 FumgVkFS4FliN5obQNV0LaEhg+Szn5WVifr3OxoRmOzTxDAl3Fc9HQIWcx1lGCbTuYLsQvD7RYx
 R7jAuhWdjq9mJpeXPkJi0nKIr65ieeVBo9iTc+iJKaFeQ8bWT3YgGVNhhuE3VJgSzN9M1jbiCT8
 a7MiFxRGehX34rn35zhiqcjJEsv+QgVIyhMUH6FjLCJs/2/SYhhs3WSZ/iuxFguEH0PV9o/HbF0
 6Y5+3vQ5h6X5DWcfIkL7vVtImrvZ0xlxvfDzdBZWQOAhvj/kdhmVkOMaqjhKaa59LEYOvi/uY/d
 MCXH9xvmLU5K+9yauHi05bmnDo3lG2AUrfO/2qm5FzrQp102AVbDQvxpTVsDemMiZqFUw8wO
X-Proofpoint-ORIG-GUID: cTGnhS4Wgpc_Gi6MNoLAqYC7JrURX81S
X-Proofpoint-GUID: cTGnhS4Wgpc_Gi6MNoLAqYC7JrURX81S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=802 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_074438_379638_837A00AF 
X-CRM114-Status: UNSURE (   9.89  )
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



On 7/22/2025 3:29 PM, Kang Yang wrote:
> This patch-set includes three nit fixes for monitor mode.
> 
> Kang Yang (3):
>    wifi: ath12k: fix signal in radiotap for WCN7850
>    wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
>    wifi: ath12k: fix the fetching of combined rssi
> 
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 49 +++++++++++++++++++-----
>   drivers/net/wireless/ath/ath12k/hal_rx.h | 12 +++---
>   2 files changed, 46 insertions(+), 15 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

