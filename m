Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6706C44500
	for <ath12k@archiver.kernel.org>; Thu, 22 Jan 2026 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cdGPB/S2sh1anSOPeZCSBZLuL/6UNTrZkzCo3aZvAM=; b=0Mb8G32WyLOFSecCOMFaBO6d3d
	kXgZjVnY2i2M7bqwliywdXlU9tef0MT7h8nW5eRAys9x9j2dTMuIFg62H6cOe9OgoSQZS+TrXk3ls
	KEtO+XoPztinVrgQ1awomSwN8lvC5wnj6KWY7ipbon6CkJmDMqdi+93kMLepQyGS2W9aDrJEo+Fn4
	VlYrOqZ81XdN9CBoLPnzeYeCO7uo6X6JZpyW5a6W82v/zg7AXfo3rFyR+PBoLw5dT7R3InvaVkG3B
	7uPU6vAb31aGlrb1Nw4J1JS7t3Q3ygBYax2gJednSQSJlIzHTT7i3M6aqvJ0umHjY4AvpWgxFeVQL
	SyLw8ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqHD-00000006fOT-2Cxa;
	Thu, 22 Jan 2026 08:42:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqHB-00000006fNm-2nTJ
	for ath12k@lists.infradead.org;
	Thu, 22 Jan 2026 08:42:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7SBXP2277806
	for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 08:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cdGPB/S2sh1anSOPeZCSBZLuL/6UNTrZkzCo3aZvAM=; b=oVloIxpRMSeqbSG8
	Iri1wV5TQcsousRHai9UnyhvC7PXW7rX41xVtR4DJ7bt8/sX/STfJ7A+3ndZCXdQ
	fFe4JhZjS+EpGAVTLW143RRh1ljA3AoJ0t9a6pALxgIBEUEDx9X+CVsn1Or/qT3t
	hVoOSS1Ta+lctlZT9XtqNm6393Ohr4Q+ZRY+uuCJXES3DxrkGnGjs3bhZ9LjurRP
	tsN9174siafzCfGxUXPItWpQ8FgZSX/EPBrG/8sj2Z/vPKFym8pQvW4i0zGCQ5op
	tPIPrOWNNe9AQLxQHAYJQfqENlA22BwAp290iYzAHfcNuUhx/LwcQiICEeOh0HU7
	8lXrDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fasjwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 08:42:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12338d13f2cso933614c88.1
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 00:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769071368; x=1769676168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cdGPB/S2sh1anSOPeZCSBZLuL/6UNTrZkzCo3aZvAM=;
        b=FdIpICgQe9LZHPDdRGmqy7d1TTit1LnVxyyaR+sto1qnx9uVlVvn87aJaFMDrvAWnd
         ozQOkOMDUzPJTaYvhIc+EGUdnu73BA7U5Vq9V2bcedcUMG6N23zc3wwaO72FWPJm8hzW
         F11GoUUyeWd8CdUHbAdE3Sach7LOiI/ccByT0d4ssEvR5VJp47ZprgCCYRQGbd68zZ2J
         5aMZs2EHfON+yCgveWfKGEvpuNX0XnYBOeSkA3wUxYDHhgsc12KHaDA3a0hhDVJ/osWf
         H4XnbcIjPlZFtiDQC6lt5oFkCWf4earPdbl2Se2WBfhA7PnjiVRLKGi66jZxRlNY/jEY
         S+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071368; x=1769676168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cdGPB/S2sh1anSOPeZCSBZLuL/6UNTrZkzCo3aZvAM=;
        b=OHPiEQEhh4RvcmjMnuzrx1XjpQvZd2D6yFHE8w6oXTe9yW/k6awzMT/mSUsTG8khYU
         GyiRKy2zVRgRAw46Q0jLt5QpRMWdrZhxyT18n7vXJqniMuGeMeMCFXKU5UgquWxNSfNJ
         THidWBPT14ie5+uFPHrNj3JQTkvflKNUBEEYJtpWm43pfdGhCRtV6fTn6b7JGfKGs/Jc
         L1QuxnE0sKGYufjWo+JfvnBkYSOnABMwISpF9OE3/ByU//3ymE0cE0S2itgQ+odJVZNQ
         R4HSHPJPEAT+jXeUv34fjoFAXq/M4TGjQ+7H+24Hu9anth5UqwboD8g5V+b70z6t+cFU
         2tyg==
X-Forwarded-Encrypted: i=1; AJvYcCVxQKFr+wRSfg0R3dopaj2Qs8LlJ2OAr/TTMp3VXE4HegReWK+tx7xeW7FbvrwrZjw40NQsUHI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2HgaY66eFZUUo7Ne815Vn4QyWlaNEaYF4cMrtws0DolhygJZM
	kisVsLqnwRUtSetDhq/bMQ990WuqX91L+Y/tKCIDhH9zYAizAi0F5OHppl0fzpNejKiPw4IZRWk
	gwtI9kUgw8q0U2l/CLcJ5i/U77E7Xs54mZNTeuKeROrzVWyFmkbtHlOnFUM67h93uHMAYSOJJ
X-Gm-Gg: AZuq6aIexFn1XqbjmGZ0Lx0hYlYfz+GLgOZ4FbKgomgEJsNI5d5D9mtnd5yv+1qjAlC
	vNstfMDrSOof9nIBRveAadjJu3vPj0t2kyLD5EclHnliGLM13XkTa+A1C6aTE9aRvHz5+mCM3jp
	RfIWjeScb0OPd+y7C0tr4Dat48b59jxBoXURdohTLyQwhjWG74nelgbYoA4gDxDwBwTNzxn5L+o
	pNUQiLSWT6cc38CHU1HUTjNp9CQsp+zfJo8MKlCwb5Br6w/6KAUkDOTGEZGeNZxgW4/J8VsLhfm
	WgbQgO8q9ZMyJghvk07qbyIm+ze8B4AUm9wyCh5yLQxDGqVudDnaCbjcw3pFMN1rM2/SbgFU/a6
	fwYTG+Fw/LehBugl10LgXZKxXrM1P0GmnEEhfMPhavvSzNSP5Rg==
X-Received: by 2002:a05:7022:f96:b0:11b:65e:f35 with SMTP id a92af1059eb24-1244b3050f4mr11531021c88.7.1769071367557;
        Thu, 22 Jan 2026 00:42:47 -0800 (PST)
X-Received: by 2002:a05:7022:f96:b0:11b:65e:f35 with SMTP id a92af1059eb24-1244b3050f4mr11531011c88.7.1769071366797;
        Thu, 22 Jan 2026 00:42:46 -0800 (PST)
Received: from [192.168.4.41] ([209.237.159.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm30230032c88.16.2026.01.22.00.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:42:46 -0800 (PST)
Message-ID: <88f05d03-2742-4b61-964f-54beafdd2e70@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 00:42:44 -0800
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
From: Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>
In-Reply-To: <52356be3d21920d84579d1a8fd803540c6f9644d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6971e308 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=T8DXQ4rxpc9enYjWm433SA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6u4s4mMX8zNXQG3WQnQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1OCBTYWx0ZWRfXwpSKOEdP9RsA
 E/XI+JkezGnm96VyLye0iDcuZLtSLTFIYmDXzS/QxoA3alF1l51wL9Eyv45ub6TxtO5fc0al5Xu
 FyxnxRy6zR9yuPnGsQ3jlrukN/IZGdhQdfnHlJPXwQZpIkfZk43t+SH6itr+dLiCQjHzldailS+
 oR55caBVmqmuFSyuP6tKvFbwWvl95IjSGljmCV2njY5qBaqQjWbI0PVv/dzi5NiTmmP8HSAqBFk
 rCJLsg/2fTJ0jh3yZO0UBwwAVzSxlZzJTmwfIVZK1jA9SdPTOgehiswMwEJ3lvNWkArpo9jEqnC
 MtcgyjnLRWSsvOUSNOJr6EEaFXpT6ErOREKqR2/+xitp4RJEGMLlS9xcHo8QhMkY727CDzZQDzr
 pZ0zRecD0M7aYp8/9BCJTueERbBMnQXiSu31szBDBP08wRZi/qlT6HrQ/f6OOJNywQgkvxLZX/b
 /ayozAS55zU10P7KDBg==
X-Proofpoint-ORIG-GUID: 9_0zFDn5eO755NVBsmCxTmHTSrvuSJFH
X-Proofpoint-GUID: 9_0zFDn5eO755NVBsmCxTmHTSrvuSJFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_004249_715738_D90835DC 
X-CRM114-Status: GOOD (  34.30  )
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

On 1/15/2026 6:17 AM, Johannes Berg wrote:
> On Wed, 2026-01-14 at 11:15 -0800, Jeff Johnson wrote:
>> On 1/12/2026 11:18 AM, Johannes Berg wrote:
>>> On Mon, 2026-01-12 at 20:12 +0100, Johannes Berg wrote:
>>>>
>>>> Why do you always want to let firmware be in control of everything?
>>>> Seems at least for some of this you'd really want the upper layers to
>>>> control it for purposes of coordination? How does the FW even know which
>>>> other AP it can coordinate with, isn't that something a network
>>>> controller would determine?
>>>
>>> A less generous reading of this could be: you guys want everything to be
>>> controlled by FW, so you don't have to open-source it in hostapd. Now
>>> you realize oops, don't really want to do all the security handshake in
>>> FW, so we need to ask hostapd and then we need keys and stations and all
>>> this stuff. So let's build something nobody else can use, upstream it
>>> and we get the best of both worlds - others will maintain the mac80211
>>> code for us anyway.
>>>
>>> Am I wrong? Is there a technical reason for not simply doing MAPC
>>> discovery/agreement negotiation etc. in hostapd as well, based on
>>> driver/hw/fw capabilities, and then you don't need all these strange
>>> "triggered by firmware" flows?
>>
>> My perception is that Qualcomm would love for all the Wi-Fi 8 functionality to
>> be in userspace and nl/cfg/mac80211 since then there would be no code
>> maintenance overhead on our part -- just you and the userspace maintainers.
> 
> :)
> 
>> But there are concerns about latency, and internal consensus is that some
>> aspects of this functionality has to be handled in firmware (or even hardware)
>> in order to meet customer KPIs. This comes from our history of supporting
>> large-scale deployments of APs, and the expectations of how Wi-Fi 8 will make
>> things better. That is why we are posting design RFCs, so that you, as well as
>> engineers from other vendors, can review our proposals and give your feedback
>> and counter-proposals. We want to avoid developing what might be an
>> architecturally pure design that doesn't actually meet customer needs.
> 
> Sure, that's fair.
> 
> Maybe I can just ask folks to spell out the constraints and reasoning
> behind the design?
> 
> Taking this specific example, it basically says "FW sends a request to
> hostapd, hostapd does the handshake and installs the MAPC station. This
> is how we think we should handle the MAPC stations."

hostapd controls and manages all MAPC related discovery and MAPC peer 
creation part. No trigger from firmware for MAPC Discovery Phase.

> It never says _why_ and how any of this happens. What's the magic thing
> only the firmware can do to figure out it should start coordinating a
> given AP? (Clearly that operation can't be concerned much about latency
> if it asks hostapd.)

In our offload architecture, the firmware monitors various telemetry 
and controls all data‑path‑related scheduling. That's the primary reason 
why our design requires offload-based trigger for MAPC feature. Additionally, 
the offload-based design only signals intent or need; hostapd still owns 
MAPC peer selection to kick-start the MAPC negotiation. This trigger will 
be configurable (i.e could be enable/disable from user-space).

> In fact I'd have expected that in certain cases some controller
> infrastructure sitting *on top of hostapd* would decide which APs
> coordinate with each other, rather than the firmware. Although I guess
> if you hear the beacon on the same channel with a good enough RSSI then
> you can coordinate.

Offload based MAPC negotiation trigger is primarily intended for 
non‑controller-based AP deployments. In controller‑based AP configuration
& deployments, controller is fully responsible for triggering hostapd to 
initiate the MAPC Negotiation Request (e.g., via centralized telemetry and 
policy enforcement). In these deployments, the offload base MAPC negotiation 
trigger shall be disabled.

> I could keep guessing - maybe there's a limited space to do this in FW?
> But there's not even anything built into the design where the firmware
> can ask to _remove_ it again, as far as I can tell, unless there was an
> (unstated) assumption that it can just delete the MAPC station and send
> a DEL_STATION notification about it.

Like offload based MAPC trigger intent for adding MAPC neighbors, it would 
be extended for the MAPC teardown intent as well. hostapd will still controls 
MAPC peer deletion & MAPC tear down protocol

> The document even says that phase 1 is discovery, and then goes to
> completely ignore phase 1 (it's hidden in FW), and describes basically
> only phase 2.

Phase 1 discovery is completely handled by hostapd, as outlined under
section (A)hostapd

>> And apologies for the "firehose" of both design and code, but we have a desire
>> to ship Wi-Fi 8 products using upstream code. I've passed along information
>> that you want our engineering team to focus on the base NPCA patches so that
>> there is the appropriate foundation. But in parallel we do also hope there is
>> engagement from other vendors on the Design RFCs we are posting. Our goal is
>> to upstream as much AP functionality as you can absorb.
> 
> Sure, and I appreciate that this is coming. I'm a little overwhelmed by
> having so many parallel things going on right now, and all the parallel
> design documents don't help.
> 
> Maybe this is the point where we consider inviting everyone who wants to
> a room for a few days? Even a video room might be better ;-) List some
> topics first, present the design briefly, etc.? But I don't know if it's
> just the medium.
> 
> johannes

Abhishek

