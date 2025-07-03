Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1111EC83F03
	for <ath12k@archiver.kernel.org>; Thu,  3 Jul 2025 20:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e66gJPAc2xxHrV57qPovzty1Bqs4Qv1z3TiDtg2p3rI=; b=3D/MkO/dZ8PjzvQwuhuPRtNJpy
	yFkcGaW3RChGk+T0c2xa/x2ifNC67E3YvbqtW2a+AzNpZ3N4d/raj41o208yB8SJibVvgrEYCy6bV
	xthgNJUe1jM2+FCcvcx/OpI4JdxtWZm+9HtoXo+ovlWkulwptJqmBPfuCX5CiXwxEGdJ/TBW184B3
	Lo3VHkdz1N6PmkOpSe70j/BfHtNToSXlzu+roaGB+BQ4A0P/w3BP/Pv7Z5W7xXDsOdJm8M9pHRzQ6
	8epwrBSj6BwBrTXYcIJJWdvnc8aAb87w3T/QyBC7sAuT1hBExVT7kL9ziqIChCJRYUX/GUwdXBVML
	WAxFQtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR0J-0000000CUW6-3pPT;
	Thu, 03 Jul 2025 20:57:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMH0-0000000Btzr-3SZj
	for ath12k@lists.infradead.org;
	Thu, 03 Jul 2025 15:54:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DfBx5007732
	for <ath12k@lists.infradead.org>; Thu, 3 Jul 2025 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e66gJPAc2xxHrV57qPovzty1Bqs4Qv1z3TiDtg2p3rI=; b=nfZ3Vsip35cjxAb5
	JzAo3tUZeDQTIonX8+mC0Owgn2JWD7V0yTFXpmHkJcreN+dTQAW+Fq4BV8QiAcrb
	vWVpnzPtNjKm+AA0Vu+AfOCpybWX/g9PffjjxeGpG0R4M/B830zwU5fobltiNEkK
	+sJPDwk8nev7WgORZ+/NF5elH0VoU+D8TeHap24y5ypI4EUJnosO2oDWuVeVK2+m
	Tu9GCm3Zg2N4YpQbkD7cVco0OpQcWu5u89AK4L1ZO2vYBo9Wt0fNm0PoSSFRdqH1
	DeIC8Qov6epeZCy8XmC39A74YxjejBzAr5c2tq2Z0InXKSVf41Xk8OJiNIStcPpH
	F57iLw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw38th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Jul 2025 15:54:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3642ab4429so10534a12.0
        for <ath12k@lists.infradead.org>; Thu, 03 Jul 2025 08:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558093; x=1752162893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e66gJPAc2xxHrV57qPovzty1Bqs4Qv1z3TiDtg2p3rI=;
        b=qUCNY/5RIO4Dk9xZdO9GixhKLVZKc5+krtjIj6ltKVQFbE+V1F+ig0XHVAN0NInIrr
         +939i1C1nmaj/RThjCeTH1TDl4+rUDxjlsgSmtYmxoVz4yYV0xsdgN9mKmN/rOIQehjn
         NYOanjlIPtYY9CGM5X/hxvOGfAA9ynkavmkezGv3qKbj+PST2FW79IvFQ7K/yxQ5B0ju
         hePqSmWsMlxB0gXqdosoGcxQP4RN3z4eBZVUnBiYdVklDlHjpfD6mUQoCbtWM/br48yh
         6cxpOmxsPQ2JYo8XOzg9Pj6+mqkfgLei+XlzjZ5cQ+gWWwrk8bs+hUNAyu5hVwMWpYLT
         vD4w==
X-Forwarded-Encrypted: i=1; AJvYcCXQsG0Ggc3SGnvo0KJZhx+LXKzdWciJQMkYKyfqdFPb8+Bxq7oLf9n/uX+ztv52qDF0iFm5NbI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiBAN7NWaiaGsxax7Jwz1oDVqAKaJqDPRxczialxVQs3dWf452
	vEofmfpzw1LAYjo0VHgvkpur8ylqLrjXp3Stib8iz3oQ2U1EYV/7gNCwOPddvfQjsjy7r/GNnJZ
	77IItFbJxO72D9QtPEB5o0TM7KCEh8zXBbBo1FgAE80axqtP4RsV6OMCZpiiCm/Z/
X-Gm-Gg: ASbGnctbQOHVXFI2t/urqB3Ww7rrlPkJ/l2Ua5aT8nKGP5hFtafZP1qxFcGKqgYg/Rm
	egTFHSJPsLZSqe039Kwce3Cty2g/0HBBgDBDuJ6l1TJEfTXShHpVWmyYgEWMV8BiD/pKEb0d0lt
	xV/VCNb1l5V5DIv1pJFi7RhF8PbMePbV7R8n78QPFuR7sP7jy/Octn5JgkNojvxDhqpdpc6mSv+
	ekDc2jwTrrKgynjulyaKCYgPT92nh9mI4VHO6XERTxJ7OxcON+5187aqT+JFghWjAxNNNvsJTSo
	zzRIY3n/Ixo5YqAshUS3PHb+BrgjLpTE4GNSU6s+sqyfmlk8s/7O4Fk6man7kRdYtcD+6kTeGqe
	8eg==
X-Received: by 2002:a05:6a20:9d91:b0:222:1802:2ddb with SMTP id adf61e73a8af0-224096f8886mr7277310637.8.1751558093143;
        Thu, 03 Jul 2025 08:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfovFLKP4ugccyq6pnPkpHs0glNAnh7iMFcqkw0GbaDtFTnQSzrA3bcHKulIzAv25RYx7aCA==
X-Received: by 2002:a05:6a20:9d91:b0:222:1802:2ddb with SMTP id adf61e73a8af0-224096f8886mr7277279637.8.1751558092718;
        Thu, 03 Jul 2025 08:54:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a846sm16542311b3a.31.2025.07.03.08.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:54:52 -0700 (PDT)
Message-ID: <20e56c81-8327-49dd-8d5a-09df66a724e6@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 08:54:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add 802.11 encap/decap offload
 support
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=6866a7ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=obG9VW9YuJGvX6oOf2IA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzMSBTYWx0ZWRfX5cggFOfDKSEO
 W6I3Vn0TcFn9unsOMqm5iJBb/gpXUagImoj2kAWga/8w6Xfdgs104wBMSmLri7hzWCbnP74olbJ
 /UugGsL9LCl3MOJaTpxvZMKbk3EylXnyOxN8MJYL2Ln0Ys+AZeBABFf0qLPtr34g374/P97MBQx
 41Kw8bhSRBqO7GELQdCUfiL4oXW6vLR5EmkdPPLzO+trx1t0Pm5XvFaiSMe0Jhkv1Itwm3Ag6wa
 2asPuy9cnyU61GElH3Ffmg7j3ks2JI7XarNpW0z5EeeWWhuIoS02XO6drcKi3r+/vEbFSAgEshm
 ivCRZjk91DaDU1zcLmIOA3DvKqCEcELdXnT9EPV6HODJL3K6oevmiArAAiLkthZc+zMWZF1eNZ/
 CqtYTkpv7qvtkrsoM4UsL3u7m11XQ9QHn3Yn9dzeeAdBZUw//QWFoQOsv9lLtc9I16wxg9TI
X-Proofpoint-GUID: dhKHxnpmMwILvZWjYYzY3QdeztAW5oJH
X-Proofpoint-ORIG-GUID: dhKHxnpmMwILvZWjYYzY3QdeztAW5oJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_085454_877718_4405BB3E 
X-CRM114-Status: GOOD (  12.32  )
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

On 5/30/2025 11:02 AM, Nithyanantham Paramasivam wrote:
> Currently, the mac80211 layer handles construction and parsing
> of 802.11 headers during packet transmission and reception.
> Offloading encapsulation and decapsulation to hardware can
> significantly enhance performance. This can be achieved by
> having the driver advertise hardware support to mac80211 to
> bypass 802.11 header processing
> 
> Nithyanantham Paramasivam (3):
>   wifi: ath12k: Fix the handling of TX packets in Ethernet mode
>   wifi: ath12k: Fix TX status reporting to mac80211 when offload is
>     enabled
>   wifi: ath12k: Advertise encapsulation/decapsulation offload support to
>     mac80211
> 
>  drivers/net/wireless/ath/ath12k/dp_tx.c | 101 +++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/mac.c   |   3 +
>  2 files changed, 93 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f

I already privately reported this to the developer, but for public awareness
I've dropped this patch since my laptop fails to connect when the series is
applied:

wlo1: CTRL-EVENT-DISCONNECTED bssid=xx:xx:xx:xx:xx:xx reason=15
wlo1: WPA: 4-Way Handshake failed - pre-shared key may be incorrect
wlo1: CTRL-EVENT-SSID-TEMP-DISABLED id=0 ssid=""<my SSID>"" auth_failures=1 duration=10 reason=WRONG_KEY
<info>  [1750467721.8771] device (wlo1): supplicant interface state: 4way_handshake -> disconnected
<info>  [1750467721.8773] device (wlo1): Activation: (wifi) disconnected during association, asking for new key
<info>  [1750467721.8775] device (wlo1): state change: config -> need-auth (reason 'supplicant-disconnect', sys-iface-state: 'managed')
<info>  [1750467721.8778] device (p2p-dev-wlo1): supplicant management interface state: 4way_handshake -> disconnected
<warn>  [1750467721.8784] device (wlo1): no secrets: No agents were available for this request.
<info>  [1750467721.8785] device (wlo1): state change: need-auth -> failed (reason 'no-secrets', sys-iface-state: 'managed')
<warn>  [1750467721.8789] device (wlo1): Activation: failed for connection '<my SSID>'
<info>  [1750467721.8792] device (wlo1): state change: failed -> disconnected (reason 'none', sys-iface-state: 'managed')"

