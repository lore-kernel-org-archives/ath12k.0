Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBC1C7EE31
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVaZQsdm4HV3K9Gld7lUz1+nFeBnTyonan0a0K2Q2/k=; b=ffCKZK+rMydb3THKaxjz7Cnog1
	Tg+bE4tcyeU6vE+gE+Bx66Ztx25CpSNK6OrfiKmiF6YyOUui6ERueu30QmYN3lKhay2+KaZd3n1kQ
	ZQV1BN1OcUPFHK/I30H16zLKjxEtRkG9A49IMHDp9W9CpQYKwaEgg3LVafwSjRSqfk3NMYn/qCu7N
	fEhMUD1etZ5KrNgm/u+Ksp2O5tp2hSrG18YoDmOU3JQY1m9YiT7WTHLJ0C+tzSQ25JMpxFP3rPjxm
	Ty+vCfCm3oI9NSdv9fnLKglM5U4kV+eKYg5TTH+3tFQBhESovzNaHRPZe406NdTu0M5oNmkpbD5e5
	D5+KRxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA0O-0000000EuDX-1L4X;
	Fri, 27 Jun 2025 14:24:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9vT-0000000Et2R-3bBr
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 14:19:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCFRAL009529
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 14:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVaZQsdm4HV3K9Gld7lUz1+nFeBnTyonan0a0K2Q2/k=; b=YZEWa6aZHNM0MIBR
	F8ZFosfdVbF2S3tZ9nWXclWB2tBGUUjVWeLU/yjx+rJO3SEm+jCYjMofoe1Q1WwP
	MThqa6wdWaoEzqAFVqerWo/kN+tW70tL4zXXmb0a2olYlzqWML48F5eD54StB9LH
	nf2H0RSBUyHXVZ+UidmUPBD6kaSvlmSPvoldD6M8ekeNUFRJhWXYuftJ9HKhfIgn
	ma20xYG/2Ir/IN5LTZlcMPEEPMwRrMBGbL1wdRbPEevnwBVNCzOKKnkImGmCWF0g
	LNTmGyUmQO2visUaRe/JJs9V85FC1kTBelvYu51fGwTWhu397QX5N69XKMKeHUny
	mPZItQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b4713s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 14:19:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2358de17665so22222885ad.3
        for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 07:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033974; x=1751638774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVaZQsdm4HV3K9Gld7lUz1+nFeBnTyonan0a0K2Q2/k=;
        b=pFJplncEU3df8oVBmX7p2DdmFN5JzYS+havxYT70oqlOeZHw78VcgXuZWc/h/fUgS3
         hWQ3GMWalrsJIV/5uCrHAcS5O2GHXHTCw1FdXo0oOESCC6nsERW5uyFaBOPhFYDNk3pm
         S+B4G9lR4DF0rdIngk2B5HXVpE+yEF1Nsk/Py/xtmOJivTodSktuOoL76L5JghYFdD4D
         et7bv4Pmoo8yQNSLNUee2AiV9vkg7AqIaDoXT6SkYBJKkoTquiRERws+a76/Rn41OOAB
         893bQNrJGg03Hlzl7Fg2UBxPVCLFJDon6dbc3BvUt4B7M1kVzJsHBwf4JJex8vMNYmCd
         ekHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaO6HFQMaGCrKxnj5rIF68EWtfKa2FTecUc60WJOqo7NXglrQDm60jy0ykbiUCUzcpcXFan0s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7qP8yUGV/42IspJQoxOOpkB8qYomYnMrl+ZeworUdCiewhhiz
	wwsiuDtiXahutQ0ytHBcgu8w2ipg4Dm5Zw28THfhNcatZKnz2MEMu4WvpRQ61+HF4Zw0hBnYZIg
	dWgqcUimrRFyIp8rmZ74YNk9mfRjsQd6jS05fcw9UY1Vhr3W9sMhtUYeX/4WeRVIY
X-Gm-Gg: ASbGnctx8aJOLL5lXNkpW3Z76kF9JCnEKXpwpDNqfeEuMn4Qilgcsuyi2XG+PRnvM6h
	i20aduKYHXZGH2GnqokniZd5L9j67EBRWx0Tr02y8eOfOMwsr/hicmC7uhJu3Vd3Et2eFh6IzoV
	HA4JTIJv71Ad7NAwFUrxiuD/aM+RTWi+O8AOxNgMAAD0cCXEP4uyi+SbGLxT09pSeK+hy/cFAqu
	Gd3pwRvKKRSdWbSjPQj2C/eXIWdEyFUhfbZOTZAubdGjn2veiMP1R7bAAz1kTcNFi20H88ZXkzO
	Zxk9ip10dcOow/nukXXuAtBHLoZfA01tInIvRcb8Ow3zDAgl1qsInSV6
X-Received: by 2002:a17:902:c944:b0:234:ed31:fc98 with SMTP id d9443c01a7336-23ac465d22cmr49311535ad.37.1751033973740;
        Fri, 27 Jun 2025 07:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1RRpeIvRjgjFqIrOyQpp60LXiItSyQeWKc6KRbYhDg4KhG2KSuKhg6UkL05K1PaGOnFXvNg==
X-Received: by 2002:a17:902:c944:b0:234:ed31:fc98 with SMTP id d9443c01a7336-23ac465d22cmr49311115ad.37.1751033973215;
        Fri, 27 Jun 2025 07:19:33 -0700 (PDT)
Received: from [192.168.1.2] ([122.164.80.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39c0a0sm17107815ad.122.2025.06.27.07.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:19:32 -0700 (PDT)
Message-ID: <21b7d547-b550-23a9-3bff-1f1787e307a8@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:49:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for
 mesh
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
 <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
Content-Language: en-US
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
In-Reply-To: <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExOCBTYWx0ZWRfX6G2N9upEo6Fu
 7gAF8JWhs1H8b/zqY1XEhABobn9mQNVHKUbuNvdOnLF4cQoWasSYLiGv/002ixCQDphoHBAeiFp
 2Mx9k1DFBAHlEMgwY53V+dhZO6jRXq0NaVexV8UQJVh6GD702Kwh4KWAA9kDSHV2FGp32uo6pd5
 SrNUsA3XA00XDzStvivw/mJJGJo/pLEZxUgMjtMBI20jdJ0EZatbNqhlaU+PKHI5L9wZdL5+N3A
 6FH6d39wZ4XXPU+8H4frEepGjaY5hRQRiOSHjssC4QeAb9Zwq3X2KxoNmsJlDb/2X3GekNidUWz
 hWe/y1XysanP934ufnla0sSu7Hs9d/Fkq1X548a0vvA8hn+ZrOnlJjoVJrYsVH7evTzdtsgMhN6
 Xqb10YdPC0rTjsSCneFH256W9T6DJFXZEekIJL2XLEPTQyuVJEAtum2mu4VhE95l0352Dyur
X-Proofpoint-ORIG-GUID: YbLZAbatYoCeUXNJPUzXvcLSs8Dxfpl9
X-Proofpoint-GUID: YbLZAbatYoCeUXNJPUzXvcLSs8Dxfpl9
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ea876 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tpvAdpNFOXgFvjEcSjFpoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NyqnUUIibY9oW5HF7GEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_071935_934985_FA6353DC 
X-CRM114-Status: GOOD (  24.31  )
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



On 6/24/2025 6:54 PM, Johannes Berg wrote:
> On Mon, 2025-06-09 at 05:40 +0530, Ramasamy Kaliappan wrote:
>> From: Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>
>>
>> Preamble puncturing(“Punctured 242-tone RU") refers to the transmission
>> of a PPDU in which no signal is present in at least one of the 20 MHz
>> subchannels within the PPDU bandwidth. Puncturing might be the result of
>> the unavailability of 20 MHz subchannel(s) within the PPDU bandwidth,
>> such as a busy channel indicated by the CCA or the setting of the disable
>> subchannel bitmap field (16 bit field) in the EHT Operations element.
>>
>> EHT disable sub channel bitmap is a 16 bit field where
>> each bit corresponds to a 20 MHz channel in the given bandwidth.
>> Bit 0 corresponding to the channel with lowest frequency.
>> Bit set to 1 indicates that the channel is punctured, otherwise active.
>>
>> Userspace can send the EHT disable sub channel bitmap via attribute
>> NL80211_ATTR_PUNCT_BITMAP in frequency  param as a part of join mesh
>> (NL80211_CMD_JOIN_MESH) command. The received puncturing bitmap is
>> validated and copied to chandef's punctured bitmap of mesh interface data.
>>
>> Build the mesh beacon’s EHT Operation element including
>> disable_subchannel_bitmap based on chandef's punctured bitmap.
>>
>> Validate and update peer mesh station's puncturing bitmap
>> in local structures while adding new mesh station
>> (parsed from peer mesh station's EHT Operation element)
> 
> I ... don't really understand how this is supposed to work.
> 
> Say, for the sake of simplicity, we have an 80 MHz channel, the lowest
> channel is the control channel (so puncturing 0x1 is invalid). Possible
> puncturing values are 0x2, 0x4 and 0x8.
> 
> If locally we have 0x2, that means (I assume, since that's how chandef
> is meant to work) CCA and RX is always on the control channel and upper
> 40 MHz parts. If you're now going to transmit to a station that has
> puncturing 0x8, you didn't do CCA on the 0x2 subchannel, but ...
> transmit anyway?
> 
Yes,we do not transmit blindly to mesh peers with different puncturing.
Before initiating transmission, the driver computes the intersection of 
the local and peer puncturing bitmaps to determine the set of valid sub 
channels.
> I mean, maybe this could work if the remote puncturing is a superset of
> the local puncturing? But just blindly doing it the way it appears to be
> done in this patchset seems ... questionable at best?
> 
> Can you explain more how this is even supposed to work?
> 
When associating with a mesh peer, the mesh peer's puncture pattern is 
shared with the driver. The driver evaluates the intersection of this 
bitmap with local pattern.

if the resulting pattern corresponds to valid transmission bandwidth, 
the valid subchannels used for transmission.

If the resulting pattern does not support a valid bandwidth, the driver 
falls back to using only the primary 20 MHz control channel for 
transmission.

> johannes

