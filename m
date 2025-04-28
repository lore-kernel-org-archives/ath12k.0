Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E325C369DC
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8we/A24VCleiu1L9oIyqx2x5TSIcaS7vbGyH7HDGXc=; b=ojdgbnB7LXwrGuxNVFmoZ3SwTY
	XCQqejKibhkTW744H+A1X3nbuwHEicZZidbLwzW68KKl5hnpGChx0z8ZDzbI/jP2HO82rmXJBVVLi
	JTpzogtM7nQresCwj++TygC7+sJ75Vb/aK7Mmi9ekYrUECU9oE2Uar190rOMc+sltqof7LJou0r8y
	/PdN3/bppZkMYF8ST+rbCvnMWVw/EFP5ZZNNawkaX4m+gzH4pyYju6yhWYjGJBwC99LGnFEMCDXb5
	kkjRukDqcyxxC3leHnb6AkjA3JWOSMaaKQtrrX7d7VVuOoBzZQHv6LJpypXtsH8kc6W7CBAIX3KOL
	KAUKmoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R7A-00000006sUD-0C6Q;
	Mon, 28 Apr 2025 16:13:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R78-00000006sTq-1b8D
	for ath12k@bombadil.infradead.org;
	Mon, 28 Apr 2025 16:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D8we/A24VCleiu1L9oIyqx2x5TSIcaS7vbGyH7HDGXc=; b=QZMwWonQZAngt5+H2c7AOmsT85
	Ib1jEDWKDHYk23MrPkRZnSyvr4Vlka2cv5KdWnh6K+ZKBzauXI54bFIShLX3/WmfjbsKDj6nXEAH3
	nyqYvG0Xf67lIM69HwDTqM7vRmZH1vdmDb5ZMYU7p8HDk4hHgI0YIm/7jvkiJyJKNc8vo6+dAsfsT
	tAZOPYshzvBwa42GdhHRdtS7FAKVHMB9BkJFLRoTTgVaiQrwrY+mjoCpkIQnKmoAsGEl7klEWvSxw
	9zM8RKp//h2zstIE95Ia4Yby4A2V+yCNlmsifd6kYr8Fke1i6ZLBnhnRJWRWYLEKorgPED9KMFL8M
	UuKddCug==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9R74-0000000Cs3N-3zvX
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 16:13:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9xncA018694
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8we/A24VCleiu1L9oIyqx2x5TSIcaS7vbGyH7HDGXc=; b=LXB90UClggrzgzGu
	fuS+1nPxyo+FIzjnBqnwR7vzwejyORFEEV9jnPzK7vUEKGsCqFQxJTJTW0/jBcJk
	p6O7iLjYerdGVowybofuuziJs0QcMw1RvGk6GhnENbaw5iVnHpd6BXrCkkYvbpcU
	aj8AvYfrVNC6Q2eFDEvhuoTeQdvUs+aUd10wFIW6D7xMmQ59p8HA35N4yIradAkC
	TKVi6uQwi534ks27jYNiHmimy6rYGc2mY68hhO2y9UE+8ZZaFpyUD5OdEZ+IuJFT
	CWekTSqxgPtYIZQW8WECYVmFnKKAFeYwPDySpnghwej3hEKQU1Aaq2ySFSk22+0U
	olB8xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jh00u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:13:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22650077995so71575605ad.3
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856820; x=1746461620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8we/A24VCleiu1L9oIyqx2x5TSIcaS7vbGyH7HDGXc=;
        b=L0HJSMP76ddSaxFDE9NCy+zuUaj7j8Aipw4Ykxuy2XGrMdXPJaDXKA6C39VkGohVnA
         NXsR3pYnN0z7JShqdflsNitUf5YHyVqqMzcGKlLOJchNVrXfoFUOoDioqRc/zV96Y5oK
         kAB4sa8+hxOxSzS01vQ6TcHmiLuLWKKFKnaIHCTuDU6jRHz8ZrdSV3DPBCSLgyN4J/1E
         rcCTFsqWRzbHkPuxzM+JFykHp8/C9jPJSRypX9pKw8DziqFcWWOo4gCvEnZ2YgpDo1r3
         n1YZ94FxuoUtVZKRrkYwOy5AUpItv1ao/UgqePQD/s+S9X3AfY3QCagO/dZmZPV0Sepx
         SVmg==
X-Forwarded-Encrypted: i=1; AJvYcCWdptem2Efk0tdy8mModuD7gz5Vq5yjX/7Ssow0PrHxbuGr5SQ4y1/Jx+AtwDtKjsEsjaWGGNk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83qGFXNF6IzoY7Z/CEkJCNPKiyD+0krBa115jI6n2n/z1Vgrb
	ipjvyuoDONHZtBR5XuJcbqv5BPhiAjnBIply+w+xMHwU9Px0ywrNRFMmHuebGnfddzVQBJ3U8+d
	5aZ1FilWw1L5KkC8H5ctyrclRN68FVqJ7addLv2xY4DJt9IQDfUtp27fYE1NJf+SLsnBK
X-Gm-Gg: ASbGncvEt01DRECOqtewVkOTOFZv9piryPAfxpwYg3v46ryDAHrvJsYxTE5uMa/9Ncj
	wzHP/tOwdMjLwZeR10XuUDtsC9ip+UNcx1VMU/84nCgtxpM2gbyCaG+T0/4eOZFTb36yQOLdmLh
	YIogA5o1Yw1yZH9E7UZbqeE0gdVC0IIG5MxmOuHxdflLDQzLyJbrb57BQ9F/VyuzJg1SOOyY9bS
	Q9MU0rvjxDc37jAftsCtfR8PaOV5lvqisC9sDzGLIBNUexISOFhT/HEp1McWa9V+vItqLtb/27D
	tv6wrf52nTT2rCfdzM3/ZWun1JF/4d3OrUgqnbaZucM3quZest6OKdMQSt98
X-Received: by 2002:a17:903:3c4d:b0:223:6180:1bea with SMTP id d9443c01a7336-22dbf6218damr192112105ad.37.1745856820283;
        Mon, 28 Apr 2025 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFQ7Id/p1uW87txW7F2ECaSz8fiByTLszVSkzSMB/oz9YpMbg8QzGy2y1k2FKTccnT3cawQ==
X-Received: by 2002:a17:903:3c4d:b0:223:6180:1bea with SMTP id d9443c01a7336-22dbf6218damr192111825ad.37.1745856819926;
        Mon, 28 Apr 2025 09:13:39 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.192.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef098157sm10202290a91.26.2025.04.28.09.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:13:39 -0700 (PDT)
Message-ID: <1cb0effd-71b5-415e-f419-69c727913f2e@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 21:43:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: combine channel list for split-phy
 devices in single-wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250417073954.632994-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250417073954.632994-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX1RssE/WVhUm3 3DmjwGT+QwQzNTrcwqSNVyl1gJ4pFit5vmIKLEt2KHzKANFezPFtjxWtVd1yZZ/UL+Hg1Q0OuCu en9SsocUrH4RcJYn3JF0mbHfgXKidc1++jUoAJ6rjFo+p1P8We/n4KjRHUirO8SXcrqG719aNc2
 ag5u5qDKrueKs+IMhQaLyb/bIhjAIFzSxfemxEXWBYz77JazatX+tIVoHr3ImdEwUjT1LfuSYok qCEY/OVkzMzE2SAnWoXjRAZANUHtFPjhP0XJF4EiRq4JudPTu8zUXa3LQ3fenXjcgdnZKIISkAW BePuAc6VuKFWMnTAjwkYd7moWFIAWFas4MiDyIEmDbpO/1ED4VoSRcGmIZCKYYzHRwxzDiNrtrG
 EYUpqnMqtTLH/m9iSOWw6yascYzl4LJUaMhEQq+yqBiIm08eOR4fEf6TxCQIyWo4RAiSrKst
X-Proofpoint-GUID: tzEm-HrJDD8J1eY8MtReErtvT6weEl79
X-Proofpoint-ORIG-GUID: tzEm-HrJDD8J1eY8MtReErtvT6weEl79
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680fa935 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=XJI/iaC0GbrNbCf3OOiYRw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=2LzJI_1lXDcI7TO63KoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=883 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_171347_506804_C5607AB1 
X-CRM114-Status: GOOD (  14.12  )
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



On 4/17/2025 1:09 PM, Rameshkumar Sundaram wrote:
> When two split-phy devices that support overlapping frequency ranges within
> the same band are grouped into an ath12k hardware (HW) setup, they share a
> common wiphy instance. Consequently, the channel list (wiphy->bands[])
> becomes unified across all associated radios (ar).
> 
> For reference, the devices are:
> 2.4 GHz + 5 GHz Low Band
> 5 GHz High Band + 6 GHz
> 
> The first radio probed within the 5 GHz range (say 5 GHz Low Band) updates
> its sband reference (&ar->mac.sbands[NL80211_BAND_5GHZ]) within
> wiphy->bands[]. However, when the second 5 GHz radio (5 GHz High Band) is
> probed, it replaces the existing wiphy->bands[] entry with its own sub-band
> reference. As a result, wiphy->bands[] always reflects the channel list
> from the most recently probed radio in that band, restricting supported
> channels to those within its specific range for upper-layer.
> 
> Fix this by updating the wiphy->bands[] to just enable the channels of
> current radio when there exist a radio which already has set it.
> This will make sure wiphy->bands[] holds reference of first radio which
> got probed in 5 GHz band and subsequent radio just updates the channel list
> in the same address space.
> 
> Since same sband memory space is shared between radios of a band, while
> determining the allowed frequency range of radio, its frequency limits
> (ar->freq_range.start_freq, end_freq) should be used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

