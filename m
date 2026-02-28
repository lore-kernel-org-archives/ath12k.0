Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49744FEE4EE
	for <ath12k@archiver.kernel.org>; Sat, 28 Feb 2026 17:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0fFfO0ZQhwAkJNDcDYSS5AH311BSoJ/QxT7ERmHq4A=; b=dLYcWIcRUjy/twvly4ltYirHar
	w8rg1j+2jzb9/rrHwA6KBe+5qoD04TIH6t4g29+lkR7if5diQURMahfU2LPk2yc8r0Q3Qs2aA3im9
	asp10Dx905DwjGxKxjLzvncf5/EAndE3EFIG2Q2hItv79CwKhY/K/3AHiCJFal+b4+323gIYaSoM4
	vZnDZOIqgkf0V2F1xGhIxW61Ep6sjvmJrtSvsugRbdDEr2HEY7FBgiXJstmEBGBU0sO/H7AqPktvd
	k1Evv8aarqH/LwsD6popKHBQ3l2FD1hJlbwxWSk21wo4RvMuKuE3WGCFuoS2NVr9QpRxI9YKawkgJ
	1xBdd4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOCq-0000000A6cv-45fJ;
	Sat, 28 Feb 2026 17:34:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOCo-0000000A6c6-38KP
	for ath12k@lists.infradead.org;
	Sat, 28 Feb 2026 17:34:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH03ZM198633
	for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 17:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a0fFfO0ZQhwAkJNDcDYSS5AH311BSoJ/QxT7ERmHq4A=; b=kSSbuRNjXaoVlUDz
	LqVvUO/N8qExFcbG9tc7G415XRwa4aLOVimHZN3eDrSYb9GSqhdKihH3ISLktE18
	6xT4cs8KIik8gJ+HTftxUjqXYxDblNXU0GeIoJZZ0pt6cCZRLJGW0OLMJkhtES32
	GKJ+3bWKNAZIMsayWHS71gmnv8w7PLFn62xCgm33yZSRe17dNGz3wlMKI7WAZcZX
	VVlnhMSjuaPRMviwHgo5mrl0x6r6me7LKdZ8H5NLcO6ZeL1Fr2NX4yn1mfXK0x7J
	8IEA0vu8oG0JSHX69KDItrrEASCr3Fw1ysffcE6OgSHCTnCQ9XdZOvPFvZNcwG/E
	Ziu17A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshchdde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 17:34:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12776bebeb3so34588142c88.1
        for <ath12k@lists.infradead.org>; Sat, 28 Feb 2026 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772300056; x=1772904856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0fFfO0ZQhwAkJNDcDYSS5AH311BSoJ/QxT7ERmHq4A=;
        b=NKYFdsxnb1M4yUOX94kpuf/GpCQTyrG7GoVlsfjkG4E9DzWWnDSHfpUMe/Db3+znA3
         f955s/9F0tFQoXymPvTeHgii1TcEZvbBvuC5sI/6PEpZOmSuJ1B0d7MLvlotFMU8qi8l
         u6ajWmc/vCczi7IXU9XkSGVE5/8GkmjQnnvfBtqyV7xv9KR7p/2GGTp6bO7qt6Mj6aM/
         iSVawvhADSq670ENTuGCAWIVs9pUSE3vt5jMz2NaEA4zwJwXil9Q3tolJ1j2V0G/IT/Y
         GY5l1vYn/4qi1oDXtC9etmC/584GUjJqNhhCNizTExSmLiI+qChSQwpOEXldgQ1cx74j
         yH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772300056; x=1772904856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0fFfO0ZQhwAkJNDcDYSS5AH311BSoJ/QxT7ERmHq4A=;
        b=pIXcMqMIJyACdps+5i1b3c+cI3Di0aPPsFwA19peoNpOaZ0ox/pYumReeLjSXzgxxa
         7ep/xDwYOrwM3g4iMuoAwhxB/ztPiUt61s08AYXrYuKa1LT9FO4tdRsb71mWY4ilQWN7
         OHnDuN2J3E5/f0Ilki5covo2wG1zzZA6HYKgH7TcPD/c4/4EvN8eCUCKu66fauKAmu9D
         VrOQPptVEuVChlitqDXwPmO/pRiwFW5WaYUdK6N1nUVlEcaM4B9HPCqElCEKQiZ88M7u
         KYLVnHT8WmbROccTEfd7pF7S9iOI6uMB+EY4URHOLawznszhEldeL2FzWInf7G8Kn21v
         it9w==
X-Forwarded-Encrypted: i=1; AJvYcCWsY1dNzLSYF9vvcO6UCq7KuospfD2ejz0x4shqWeE/Mp4Ig9c1CrEPUUKnBMDF5PPrjNoXWTA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw54kZMqnuYDQSQ3TktQrluoTWA35Z7c7/APYjgbWiVB/zTuJyo
	TspR5DKEBHeHfWItcVHi/kmRrrF0i1zAX0WT840xbGaZZ/Q5+vYXPpma/4Yj0EfK/2rWTSV61nf
	h69QgCbvIUWLFJskVvPutUENzrNUq016zgxdTbl9O59VndkEvkvcXfJLmi24VU3ehUWvyziD9
X-Gm-Gg: ATEYQzzhVLCrEa9sHsRuq/py0LSUaazQmBsHA6NM1uM0tkTWl25hpPOAmXfLhCPfokS
	FaVBJifbAN1BehvFejxZMHk6yCKnReciVFXQojdh8iTI7rgVtNz6LOwNB8x42VL2ddNFdGaoY8T
	I6nlpjCWmcoV27mb+2Q4gwU8trb937XgxbUSP+KfGtWdOEbd62YiwLab8x3KEbLvImnHE9WuR/5
	CEooyOLiNWQADX+ehaiw8SGTEYBgEJ1w+tzaCaQWD9W07Lz4WNI/Tp+wJIz/9PGU68dGdt6aF6M
	d1/aVSxb3Wmi+rAMWjLnuBNzF9g/tltZWFK7q5PKCUnjl5I6oI5AbyUZ1brEfI9s50HvIdQMQWF
	kMwt92sa9XrodRLlsLDPUUNCtugmUjJq1YqsOFpBbzA4RJe7Mtifi0jj8GHEHwQ==
X-Received: by 2002:a05:7022:6098:b0:123:2c98:f65d with SMTP id a92af1059eb24-1278fc453c2mr2634907c88.13.1772300056438;
        Sat, 28 Feb 2026 09:34:16 -0800 (PST)
X-Received: by 2002:a05:7022:6098:b0:123:2c98:f65d with SMTP id a92af1059eb24-1278fc453c2mr2634892c88.13.1772300055814;
        Sat, 28 Feb 2026 09:34:15 -0800 (PST)
Received: from [192.168.4.41] ([209.237.159.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899d499fsm10133238c88.2.2026.02.28.09.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 09:34:15 -0800 (PST)
Message-ID: <e007da67-a92b-44a2-a5aa-89444fd087e2@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 09:34:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP Coordination
 (MAPC)
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ath12k@lists.infradead.org, hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
 <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
 <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
 <63ff0362-4ee4-4f13-a212-dc1351eefe08@oss.qualcomm.com>
 <52356be3d21920d84579d1a8fd803540c6f9644d.camel@sipsolutions.net>
 <88f05d03-2742-4b61-964f-54beafdd2e70@oss.qualcomm.com>
 <9ea4b65c3fa5750ef57e93dd04b70cc4ec5df445.camel@sipsolutions.net>
From: Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>
In-Reply-To: <9ea4b65c3fa5750ef57e93dd04b70cc4ec5df445.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eaaccecLuHshR4HrUaLy56rciZPIS8sj
X-Proofpoint-GUID: eaaccecLuHshR4HrUaLy56rciZPIS8sj
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a32719 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=T8DXQ4rxpc9enYjWm433SA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=AQ0eQXHchLfFNpycfwIA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE2MiBTYWx0ZWRfXxfO6ZvzB7kGX
 IgqZWqIob2Stn04kNL+8lfsEO5yk6G599q00EKO//9ijIspU83Q1GoJL2CCedHn9mBncktvpQ9r
 6FfqogguLEgCnKtb9nW2jWx73kF379HDwMKUwS/w1khXIjSXqWYNhoGp9kR/yUglnCjEb+m95M6
 5QYbdM7tgETVLvShCXn7+q1M8i9MIbx45Q3GdE4hoBY9pTyWNr8tzb+PW4hnEStHXuHTevmTcAd
 9qeSBK3d/hjKLFKrOqsMqm3CPgB+1EyJQKu+hcXcsHZO1+uBCJkevg2KSbtj4fAedTt8RuYUnKq
 YRVO1WdFlicnLEsJCXRkebQ90cSiFy76f7KofEuF4UfkPGcgURf1VfEzoBBNsbuEzToVyGTEbU6
 Lv9fMpYiYG5rEjuwtqxC5LjDQU7VTYxcHZf6KecK76T3sTWH0Y6uWwOO0Qh2CEPmPdygVm7sq5Q
 +bIoLDF6H8b6RuaNuGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_093418_798045_9FDA93A6 
X-CRM114-Status: GOOD (  22.52  )
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

On 1/27/2026 5:57 AM, Johannes Berg wrote:
> On Thu, 2026-01-22 at 00:42 -0800, Abhishek Rajkapur Suryawanshi wrote:
>>> Taking this specific example, it basically says "FW sends a request to
>>> hostapd, hostapd does the handshake and installs the MAPC station. This
>>> is how we think we should handle the MAPC stations."
>>
>> hostapd controls and manages all MAPC related discovery and MAPC peer 
>> creation part. No trigger from firmware for MAPC Discovery Phase.
> 
> Seems to me you're splitting hairs. Clearly you have the *negotiation*
> trigger (NL80211_CMD_MAPC_NEGOTIATION_TRIGGER) prominently featured in
> the diagrams etc. Sure, it maybe that doesn't explicitly trigger
> *discovery*, but if hostapd doesn't already know about the station that
> the FW/driver is requesting a negotiation with, it probably also has to
> do discovery...
> 
> Anyway. I went to write a long email replying to some of your individual
> points but deleted it again, I feel it's not worth your and my time.
> 
> 
> Clearly, you have already decided on the architecture, and aren't
> sharing all of it, based on reasons you aren't really sharing either.
> Which is fine, I can't claim that we always share the full reasoning
> behind architecture decisions.
> 
> We should all still make it transparent _how_ it's intended to work, but
> that could also be just part of the documentation added to the kernel
> when adding the necessary APIs.
> 
> 
> Which then means that really in all the hundreds of lines of text you
> just wanted to ask whether or not "Option-A" or "Option-B" for handling
> the MAPC peers should be used, and I'd agree that duplicating APIs isn't
> good, i.e. taking "Option-A". Note we did something similar for NAN
> stations, even if they have different sets of attributes than regular AP
> client stations or mesh peers etc.
> 
> johannes

Based on your feedback, we re-evaluated and modified the architecture. 
Here hostapd along with MAPC discovery, will initiate MAPC negotiation 
with discovered APs based on programmed rules(hostapd.conf / hostapd_cli)
& the criteria specified in IEEE P802.11bn/D1.3, sections 37.14.1.3 and 37.14.2.
Additionally, a hostapd CLI command will be added to trigger MAPC negotiation 
for controller-managed APs.


Figure 1: MAPC Negotiation Sequence (ESTABLISHMENT/UPDATE)
---------------------------------------------------------
+----------------------------------------------------------------------+
|                          UHR AP-1                                    |
|  +---------+       +---------+       +---------+       +---------+   | +---------+
|  |         |       |         |       |         |       |         |   | |         |
|  | hostapd |       | cfg80211|       | mac80211|       |  wlan   |   | |  UHR    |
|  |         |       |         |       |         |       | driver  |   | |  AP-2   |
|  +----+----+       +----+----+       +----+----+       +----+----+   | +----+----+
|       |                 |                 |                 |        |      |
|  +----+---------------+ |                 |                 |        |      |
|  | init hostapd & HW  | |                 |                 |        |      |
|  | MAPC support update| |                 |                 |        |      |
|  +----+---------------+ |  MAPC Discovery |                 |        |      |
|       |                 |    Request      |                 |        |      |
|       |                 |(MAPC capability)|                 |        |      |
|       +-----------------+-----------------+-----------------+--------|------>
|       |                 |  MAPC Discovery |                 |        |      |
|       |                 |    Response     |                 |        |      |
|       |                 |(MAPC capability)|                 |        |      |
|       <-----------------+-----------------+-----------------+--------|------+
|       |                 |                 |                 |        |      |
|  +----+---------------+ |                 |                 |        |      |
|  |alloc sta_info store| |                 |                 |        |      |
|  |MAPC capa & params  | |                 |                 |        |      |
|  +----+---------------+ |                 |                 |        |      |
|       |                 |                 |                 |        |      |
|    +--+-----------------+-----------------+-----------------+---+    |      |
|    |                     MAPC PEER CREATE                       |    |      |
|    +--+-----------------------------------+-----------------+---+    |      |
|       |                 |                 |                 |        |      |
|  +----+---------------+ |                 |                 |        |      |
|  | Based on configs   | |                 |                 |        |      |
|  | and spec criteria  | |                 |                 |        |      |
|  | Initiate MAPC      | |                 |                 |        |      |
|  |   Negotiation      | |                 |                 |        |      |
|  +----+---------------+ |                 |                 |        |      |
|       |                 |MAPC Negotiation |                 |        |      |
|       |                 |     Request     |                 |        |      |
|       |               (scheme params & APID1)               |        |      |
|       +-----------------+-----------------+-----------------+--------|------>
|       |                 |                 |                 |        |      |
|       |                 |MAPC Negotiation |                 |        |      |
|       |                 |     Response    |                 |        |      |
|       |               (scheme params & APID2)               |        |      |
|       <-----------------+-----------------+-----------------+--------|------+
|       |                 |                 |                 |        |      |
|    +--+-----------------+-----------------+-----------------+---+    |      |
|    |                     MAPC PEER UPDATE                       |    |      |
|    +--+-----------------+-----------------+-----------------+---+    |      |
|       |                 |                 |                 |        |      |
|       |                 |                 |                 |        |      |
|       |                 |                 |                 |        |      |
|       v                 v                 v                 v        |      v
+----------------------------------------------------------------------+


Figure 2: MAPC Negotiation Sequence (TEARDOWN)
-----------------------------------------------------
+----------------------------------------------------------------------+
|                          UHR AP-1                                    |
|  +---------+       +---------+       +---------+       +---------+   | +---------+
|  |         |       |         |       |         |       |         |   | |         |
|  | hostapd |       | cfg80211|       | mac80211|       |  wlan   |   | |   UHR   |
|  |         |       |         |       |         |       | driver  |   | |   AP2   |
|  +---+-----+       +---+-----+       +---+-----+       +---+-----+   | +----+----+
|      |                 |                 |                 |         |      |
|      |                 |                 |                 |         |      |
|      |                 |                 |                 |         |      |
| +----+---------------+ |                 |                 |         |      |
| | Based on configs   | |                 |                 |         |      |
| | and spec criteria  | |                 |                 |         |      |
| |   Initiate MAPC    | |                 |                 |         |      |
| |    Negotiation     | |                 |                 |         |      |
| +----+---------------+ |                 |                 |         |      |
|      |                 |MAPC Negotiation |                 |         |      |
|      |                 |     Request     |                 |         |      |
|      |                 |   (TEARDOWN)    |                 |         |      |
|      +-----------------+-----------------+-----------------+---------+------>
|      |                 |                 |                 |         |      |
|      |                 |MAPC Negotiation |                 |         |      |
|      |                 |     Response    |                 |         |      |
|      |                 |    (ACCEPT)     |                 |         |      |
|      <-----------------+-----------------+-----------------+---------+------+
|      |                 |                 |                 |         |      |
| +----+----------------+|                 |                 |         |      |
| |If agreement count   ||                 |                 |         |      |
| |is zero for MAPC peer||                 |                 |         |      |
| |then initiate MAPC   ||                 |                 |         |      |
| |peer delete          ||                 |                 |         |      |
| +----+----------------+|                 |                 |         |      |
|      |                 |                 |                 |         |      |
|   +--+-----------------+-----------------+-----------------+---+     |      |
|   |                     MAPC PEER DELETE                       |     |      |
|   +--+-----------------+-----------------+-----------------+---+     |      |
|      |                 |                 |                 |         |      |
|      |                 |                 |                 |         |      |
|      |                 |                 |                 |         |      |
|      v                 v                 v                 v         |      v
|                                                                      |
+----------------------------------------------------------------------+

Abhishek

