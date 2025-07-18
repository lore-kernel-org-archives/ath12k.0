Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1EBC83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf8I+kRP1GTFcctuOp3Hq6TFwDrPAlRHX+k0G5vJD98=; b=xWnACoCV6kwzK27AVKIlMTR0kC
	cOpwVnvNKdCZjw6OqgZ9IrVt1gaCNwIq2q9E3SHPcLhkxITpecpOnz3tmwXdKHnRZQ9AMm2fT86Ew
	jDj00oSadv52ZrWKdf/tDHyLpW34fROi/2jYJSdTMoAS5W+7KeLGdC0oal0ZJSWis/vGZHpH5OEZm
	MirDAXvp0D5v+KXky3FHUjoiHw91WYGjOCqrfgRQVl0DgQOeK7H4wd0J+AKYT6WfL/udBGe5qeQnQ
	igF8r/OYey3xZaRIYubcKwnyzQ0nSit2/PaAwGrv+4CwNPKOS8Zwc6v5MwHZeWlD2h5On4i9FcJGv
	UFG0zBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoGs-0000000D9iq-2RgZ;
	Fri, 18 Jul 2025 16:49:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnyj-0000000D69d-3DsE
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 16:30:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG3DAX025369
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 16:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mf8I+kRP1GTFcctuOp3Hq6TFwDrPAlRHX+k0G5vJD98=; b=mNZyl8ZlbIhLetIh
	F2pNCuIOAyqV9o8hAqB6wd4jABA4f3OzO5/V7HYwSjNw3IXbzTZWsvsiNtIMuOVP
	Qv++vcZXvIYm7rxK/sCZf/MoEES2k12VzM+p0TF6nVqduEP895M6fkdgHUwyeRvM
	0X9e4RGZMti9xzULxvQ61MNAfmDHjTWEMrSxjOO1VV1xuRADQi6qpYgMP8tLZRu0
	KvauIX1HnLzmcCtFNvFPLdIutavDiYDI7mYBEQ+ni9TiKXpZktAWklaSbS7r7+3r
	fkS6lCtwqyOjRoavrxeDAKq1eZKX+O/lxUN4bbquT5JsIL0D0IbktNXy3s0yY8gW
	hIz1gw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqgesn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 16:30:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234fedd3e51so23095665ad.1
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 09:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856231; x=1753461031;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mf8I+kRP1GTFcctuOp3Hq6TFwDrPAlRHX+k0G5vJD98=;
        b=ZeOY7Ym45qpuoleyISJ9Q8/6Lvoo3/EU8FVw0tvvCQxP+EVmUnNLWp31KIsQAU2yP4
         rngb3m6j+2t0Y1fCpgNEM4YJ213DrGvi2fjxSW2n+JZP3NT9r4q29PwEuteXbNcIxydj
         JjaqtFmTP44BENq1g+9H+4EPzVlp6Ldtmay74TuAk39IKneP8Vn2q5EqQ6k05sQknDk1
         N3/+Qs+0ywM9IA4pwZccUkW92xGOozIeu06gF3xbApmRGR8s3q6yFCT58satzlznGNSO
         3oEoIqBQIp1Us02sGO6ji8M1FHggVDazlcCo/5mchaIQdD5LSFMv8YRWRBxYYkMxjc7o
         cbig==
X-Forwarded-Encrypted: i=1; AJvYcCWAByh2t/aqMDxBo11HPoeE9o09/rWpQ37Quod4chbUPPlyN2vehq4IWP8f6clQXUj2TiOvCWM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAHEMFqTzb8wExU8gkbGD83Kft1QGzeuAS37BMnxGgN491O16m
	L5XH5X/2zCUB0dqkRhE/llM1MKoq+tjtZCEJa8dbfzIAQa/1t4iJ3F/V5MBJnkAOeINo0ViVcZt
	ktMbSqXgp7kNnjUEq2oYcmGCwCWyljcwDZg/hFZ06RuF3n5dG3QFnKptTocC8CQMFIdDZ20mE
X-Gm-Gg: ASbGnctZDZeMwyirpSha/mnB5z32aymYF4wRgnBC2wAyVPd4MHOOR9adfXoRNuujID3
	H2tobP+qCmEyTO4tTSlqj+B3kfGxv/PK4Zd6MvJ/zWEZAXVh+e9ztUFIyGhAZFdHSF+0xniaqVc
	wU0/FJ+1MHhv0VXjIuGBt6S20uvyfAFDN3rwLXyjv847XURfoJQ1bT51od1kCeQFiNqKNpwhfRr
	uJqQnbSGssAn5ij1ESQfxlGGKbJSHiZz5OMg4cOa2vH592bzhSwzaGMk5zZPE2DCBZeKARXNeur
	G42T2UFan4sGKeSu9ClwjWlgGxZFYnbjR3A+mx10xMOJxU5nivuGfvN1D0DVzYHnnDDooZ+ZulS
	7vmreSap4MLLhVC/0b15V6ZYQH2DAM4+n
X-Received: by 2002:a17:903:2a83:b0:237:cadf:9aac with SMTP id d9443c01a7336-23e2572ff8amr176249995ad.29.1752856230804;
        Fri, 18 Jul 2025 09:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWB11Y/PmMi/Ueq6vlx/4MaJoiFWJYhHXpsYm/xS7ysxjQ+WomysTx1SZIYBT9SlSEsnVZlw==
X-Received: by 2002:a17:903:2a83:b0:237:cadf:9aac with SMTP id d9443c01a7336-23e2572ff8amr176249115ad.29.1752856230115;
        Fri, 18 Jul 2025 09:30:30 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b708763sm15473805ad.230.2025.07.18.09.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:30:29 -0700 (PDT)
Message-ID: <9e6f5b97-f76f-4573-b70c-1f81c9fb730a@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:30:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to
 mac80211 when offload is enabled
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com>
 <1ae4000edd954cf492e95bdb059c89b2@realtek.com>
 <CAD1Z1JK1wnCTeObYAHALkxDVFm0kx=7r4urtA4S0XorLNOPKfg@mail.gmail.com>
 <7859082aeea642e2a3fa3a2829404b55@realtek.com>
 <CAD1Z1J+M2342-fsyc--MB+K4cd16v-csMKd38Vjm4FSdvatEnQ@mail.gmail.com>
 <429a1fbc-dd2f-4c9b-b8da-73cee76e6732@oss.qualcomm.com>
 <CAD1Z1JKSMqRRMKXEL2RUA2AKdP_FyExZ6U8XAz60aXB=B7iVhA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD1Z1JKSMqRRMKXEL2RUA2AKdP_FyExZ6U8XAz60aXB=B7iVhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a76a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8
 a=IiLNXlrfRh48qxmsI9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: -UNJVtBPTe5vtY4oVNB3jg3y3p58pTP3
X-Proofpoint-GUID: -UNJVtBPTe5vtY4oVNB3jg3y3p58pTP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOSBTYWx0ZWRfXxjxf3GL7WW0o
 X2t+5RFdxAkVdYaI9i1ltpi9neTCTc42LIHbBLMczJif09NmvG0sva+3ZHoA/sRET1gTkQZhhnq
 iw0oA7z7mvQIP/D69n9q0WW0AnFEVmJjzhOmnMVCnmsCQuO0BUn0cehG8cMa1VURw5/RzBin64M
 DaoulJZAtmDX63W7VlRoBY9TwCQIyn2NrdbU8bkWP/Ud3nJhRaqMdTKNYPnojLtL76Fn0bpGLjc
 8Bt5l+uAuwlqWkEs+T7g5wUJntuqSOTFqD6b2nLEaEzoA2Xl9dTfCDn0Lac05xHuLS2VDjDNru8
 zYicRbpZo87gBcpwmhapeNVbJLDrNZBGBtaJ967lbDUlod04nz5PJDDhvKdLrEBRhXHjKOQngAi
 mKkydl6aIrK14VguWvK/81G+J6oRi5XDa8Emu3lF8TlcrNrJe8smMK6/yPq0xHMUnKCgU85v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=988 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_093033_923656_64767329 
X-CRM114-Status: GOOD (  19.15  )
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

On 7/18/2025 7:05 AM, Nithyanantham Paramasivam wrote:
> On Fri, Jul 18, 2025 at 7:25 PM Jeff Johnson
> <jeff.johnson@oss.qualcomm.com> wrote:
>>
>> On 7/18/2025 6:47 AM, Nithyanantham Paramasivam wrote:
>>> On Fri, Jul 18, 2025 at 7:01 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>>>>
>>>>
>>>> Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com> wrote:
>>>>> On Fri, Jul 18, 2025 at 2:45 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>>>>>>
>>>>>>> @@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
>>>>>>>         struct ath12k *ar;
>>>>>>>         struct sk_buff *msdu = desc_params->skb;
>>>>>>>         s32 noise_floor;
>>>>>>> +       struct ieee80211_tx_status status = { 0 };
>>>>>>
>>>>>> With '= {}', no matter how the struct changes, you don't need to change the
>>>>>> code accordingly.
>>>>>>
>>>>>
>>>>> Both ={} and = {0} achieve the same result, right?
>>>>
>>>> Yes.
>>>>
>>>> However, in some cases, it might cause compiler error. But I forgot the cases,
>>>> even I can't reproduce the error now. Sorry for the noise.
>>>>
>>> No worries at all. If you happen to recall the scenario later, I’d be
>>> curious to know. For now, since we have been following the same style,
>>> we'll continue with it.
>>>
>>
>> {} is preferable to { 0 } since the 2nd one causes a compilation failure if
>> the first member of the struct is not a scalar
> 
> Thanks for the clarification! I’ll follow the same approach going
> forward. I’ll make the change and update the code accordingly.

Since there are a lot of these already in the driver I'm going to take this
patch as-is. I'll separately fix all of these across the ath1[0-2]k drivers.

