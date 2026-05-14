Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B5CD37AC
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 01:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiHAcjhRthz3rvDhKLHFzNKvMGqnqTuRtCwLpz/oefs=; b=HY+rdmFxZLiB11XAk6mBvxk9on
	uueDrsXA8EuScJVkkztb8Q4EIVwlaW5/hQ7idZyOz95JAdg8ppZgCU+MhdTF1wyv+OSQ7gecy2swZ
	CmIx1BE9V6kVltMMiSCxz8amSxpSoXHMFL0CNDHgqn7S0SuuCWGme/7BGVc9otK7EJ7XRecYNG6SK
	WyZaboTY+gj15pxe3OmDuVvzdcEQyedlBeRpdExGWVYsYvyHedKc4uWGZswogy6pchxdXt0pIah7i
	t6SIRE0OYu/t5Hzr8LBIJiEfs7K83qRMsCL0hmlrCialY6KCky3vXcrBRU0+RrCenAndhYfaI8Fv2
	IUJQWRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLIa-00000004Jj9-2iiS;
	Thu, 14 May 2026 01:55:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLIX-00000004Jip-2Op5
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 01:55:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1SVS93814665
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 01:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiHAcjhRthz3rvDhKLHFzNKvMGqnqTuRtCwLpz/oefs=; b=L9xiCcgMkkPS6Y1G
	z1ZZlhC2lZib/yKUF9ZBho9yO5NpKP43REn3tSLA4k1PNBLiLZJwmyic0wWnC1sT
	UHbxQqkLMXDIX8/0flcDSOkIx2JjHDihHxtRufv09ddrnB7GG1mWuB8drXOuVQjh
	PCZikmddMWxhsJR8ieOmmR0jVDv86nsMgaAVj+9qOgDWtJO+cfEUW+OTlSONDfWE
	cHwpJxsStF4JzPya2UzVBBuYev2qTFYYYL/+g4zJNE+hkwTsE+n/W2OlR8N+CdcD
	M4HVr7W3HyNBBK+aAkIbYHfkZEOLt5Aho+rQWW8gT1pYB1rAJjMgIl3IJiqk1R6B
	D3nOEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0kav0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 01:55:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baedd2fd43so45986735ad.1
        for <ath12k@lists.infradead.org>; Wed, 13 May 2026 18:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778723735; x=1779328535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiHAcjhRthz3rvDhKLHFzNKvMGqnqTuRtCwLpz/oefs=;
        b=BbjYj6NAHGiS8BpO6I8u+r+/Ev2DXwkI7tTBB8TfEgEiPAH/I5PAl6ku7J3PYyyH7p
         qv7pMS+eoN2wdV7+EV3wuzFJsZlXoXl2ClnKhSw9EkwxAGiAwUkkKVX4+BJuC5YEW4NG
         w0Fng5q+w6AtRNzNNmV8kegqoSjfvAnm+IW+JdcZotA+6/4vooo+GWWzPZDNnsQIpiG9
         7C7NvmotuSGbmcUf/4RIr39UnwYIBUaKQpDf7gPZwNPEA/0Mbb8UIqTH9hFzK3TEi9un
         dM55NdIU2CoU154PnAw3ugSFJw03O4MYq76xF7HvdWMuC1C8Z8exudEqg20uix+UcmnM
         /5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778723735; x=1779328535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiHAcjhRthz3rvDhKLHFzNKvMGqnqTuRtCwLpz/oefs=;
        b=g1GEiZ7qV4SknoNLRjciorc45JuzTCqui2SEy9HOS+tWmAWmB0eqiwYkYz8cR9v7ZG
         hdTE6br8m/Ezw0IjwouldliSQdfInlmHP9QsASSk0ZCPZz2khwlCCLyOT4+KH0p+afi/
         QXpDqD2/d/SzzRowRduug9+qtYcWOMK65ae3ujTfKZTpymlHodD23exKCmf8KxFgfLGt
         KkSUBVpLToHYcjlPmqWCOkt9vC+Kb+fW68l8k+A1g+mBpycI0ro/8igeESzuQxzlh+VA
         mnwW5r6TYqssmPP/Fd0TBxSgvh/Ftxqcd8wMfm0cweWeMlr9UhLn4EsWTiIIolU91G8u
         3nBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T+MfEQfKZ7h6pQze2QuxKyGapk9QKneesCDv6j/g4oAAxPSZzsY9OAYEbzWHD50yqRwC7ypI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5xWHPhfcljVZQFGqlcjOebdLL7XAE7nZPQshnC3k2me1NdR/m
	px7u3bFXBXxA+9tFqGsMRvoJLYq9mLwfa5HpeUPd5zvjgacmeWAVErjQbeeZ9qk0tMGVPoEqOg3
	tnqYNl9g5d1OiexdhF8D8h5jF97WwcZn5qU/E8r7eKzLIvv1H3N0xoo6kBS5yQOr2
X-Gm-Gg: Acq92OGUvuyN2sCM+751ZxHhdrr9OzcY0MfLTc0q+DcynjBbW8rxF0R4ZXnSV+jxKoN
	82Ml2/w6iyZCQOH8BK0qukYRI+nypppicCl8h/72iZEWfH4wY+7skvADuYOHoPTOKUiGl0Kpqtc
	COWjrtC30dBfX+s21hg4WhyH3nb2CvapZ9DzC3wcOjy5XDlMTMpgdGpL3JWXV4FVRyafc/32MYS
	UlVCSYkMkZ3+kUEWxUMmFvmKoIgvtuv5yOXEY8em6GLawksxBM+fw0fCpVSUAuZr5F31UIgtpsd
	MA1yKTol4yltbRidKPTjk+5dhGnxxjui5/XN43hKy9pJau+s8UbC7NYhJyUIOXYgHaDJ53Y+8N1
	dC6WlJWSqz/OeLHe+SxDHXJMVgjGtbpZBvNt7jNZ4COBfdfDw4hAtfFGWgmkyD2CP3dkE61rq4e
	c/2IenLKswL+lQmd/zXqCWfRH7DFuGOg==
X-Received: by 2002:a17:902:c944:b0:2ba:6ffa:bded with SMTP id d9443c01a7336-2bd3032f994mr56183365ad.37.1778723735182;
        Wed, 13 May 2026 18:55:35 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2ba:6ffa:bded with SMTP id d9443c01a7336-2bd3032f994mr56182855ad.37.1778723734389;
        Wed, 13 May 2026 18:55:34 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb35sm5736575ad.12.2026.05.13.18.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:55:34 -0700 (PDT)
Message-ID: <0ef41d1f-e9ec-4f90-9f6a-77cb8fa3a7e7@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:55:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
To: Marcus Glocker <marcus@nazgul.ch>
Cc: Maxim Storetvedt <m.tvedt@tutanota.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, jjohnson@kernel.org, kvalo@kernel.org,
        Mark Kettenis <mark.kettenis@xs4all.nl>
References: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
 <0b450204-9afc-4ba1-b9c5-1876b5a7078a@oss.qualcomm.com>
 <tzkh5t3bmiqff67g72rihapizz2u2dlj4xfrr324d6yg4rtltt@3qrsymzw7c2c>
 <92ace4b9-143e-4962-90fa-215a22e24796@oss.qualcomm.com>
 <cz6dbqafvulifyrefsxzwrlq5z5uojylphqkq5oydbn2bvcns5@bhj3hr2rvxhq>
 <fxrzvhcrbkugzfzmj6h5netczccav5hxfefzyns67t5jhakk5w@pp6addxjkdb2>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fxrzvhcrbkugzfzmj6h5netczccav5hxfefzyns67t5jhakk5w@pp6addxjkdb2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAxNyBTYWx0ZWRfX2tNRld6sZgSc
 WXqo6km9ZtosjgsjSsu18wEwrXS6L3S9bIsgljlKdcObf9CUZEKOr9qBhfJdWR1MoQ4IfSdbpgC
 SPmbUbVw/IkiLNOz8K41iwcSYm0g24QctqM3n5PBgxyVZ1I6a22318S4ScbvYXjggAEIhTwLUtf
 v3Poos+rp0pJmn7oInRDk/uirDP+gUXf6ijBmMxvFUr5lBoN2gk7GSGi8eEM10dt8cYKuOmTQ2A
 /o5LhzRlJshgk6XDFOGXZ+XKsL97VFf8fRhR5STJCF1QexktzAHTUz8HnI+H2PWRpina1mFZ9p6
 3aiEc19+TG2CzHcNWe69us7ik0r1aIh3o7Jf3l5hXCSOMDcrjWDUW0zYMW6qePaXbQli2hB02tw
 fFecVYVQTUIyksNvnawqgrV6Hf6JxtVtsebHfMiyQpwuWEf6H4eoGRk0g/kGWaXrf5ETfHYSdyC
 9PqVDH4Z6CTPcppf41g==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a052b98 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=E_MRXsYlAAAA:8 a=juP3Sl5wJPrPkdtuZ-8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=486ROa2Zizi0ivMXnIml:22
X-Proofpoint-ORIG-GUID: 17eAxtzbfuG4sNIj9Cq-dEXzPxqVUzNv
X-Proofpoint-GUID: 17eAxtzbfuG4sNIj9Cq-dEXzPxqVUzNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_185537_739380_5D658F25 
X-CRM114-Status: GOOD (  33.05  )
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



On 5/14/2026 4:47 AM, Marcus Glocker wrote:
> On Wed, May 13, 2026 at 01:26:50PM +0200, Marcus Glocker wrote:
> 
>> On Wed, May 13, 2026 at 11:05:05AM +0800, Baochen Qiang wrote:
>>
>>>
>>>
>>> On 5/13/2026 3:59 AM, Marcus Glocker wrote:
>>>> On Tue, May 12, 2026 at 11:38:06AM +0800, Baochen Qiang wrote:
>>>>
>>>>>
>>>>>
>>>>> On 5/5/2026 5:08 AM, Marcus Glocker wrote:
>>>>>> Hi,
>>>>>>
>>>>>> We're porting ath12k to OpenBSD as the qwz(4) driver, targeting Samsung
>>>>>> Galaxy Book4 Edge (X1E80100 SoC, WCN7850 hw2.0).  Scan, auth, 4-way
>>>>>> handshake all complete; ~2 seconds after WPA2 AUTHORIZE the WCN7850
>>>>>> firmware crashes deterministically with:
>>>>>>
>>>>>> 	dlpager_main.c:147 Non Page Fault Exception cause code 0x 23
>>>>>> 	at Address: 0x 1792000
>>>>>>
>>>>>> Cause code 0x23 isn't a valid arm64 exception -- the fault is on the
>>>>>> WCN7850's on-die Hexagon Q6 DSP, with QURT's generic exception handler
>>>>>> (which happens to live in dlpager_main.c) printing it.  So this is not
>>>>>> a host CPU fault.
>>>>>>
>>>>>> Per the RDDM segment table (at the start of the dump), VA 0x01792000
>>>>>> is the start of the chip's WLAON_DUMP region (size 0x820).  The Q6 is
>>>>>> trying to read its own always-on hardware state region and the chip
>>>>>> refuses the access.
>>>>>>
>>>>>> (Samsung, Asus, Honor) with multiple FW builds.  Currently testing
>>>>>> with WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>>> (fw 0x110cffff, 2025-06-25) -- the exact blob a Linux ath12k user
>>>>>> runs successfully on the identical Samsung hardware.  Same board-2.bin,
>>>>>> same compiled DTB (upstream hamoa.dtsi based).
>>>>>>
>>>>>> We've field-compared qwz against ath12k and ruled out (byte-level or
>>>>>> wire-level):
>>>>>>
>>>>>>   * QMI host_cap, m3_info, wlan_cfg, wlan_ini, bdf_download (all
>>>>>>     fields including ce_config, svc_to_ce_map, shadow_reg_v3,
>>>>>>     feature_list, m3 paddr/size, nm_modem)
>>>>>>   * MHI bringup ordering (BHI -> wait SBL EE -> wait M0 -> BHIE)
>>>>>>   * BHI/BHIE DMA coherency
>>>>>>   * ASPM disable before MHI start
>>>>>>   * WLAON_WARM_SW_ENTRY zeroing + QFPROM_PWR_CTRL VDD4BLOW clear
>>>>>>   * static_window_map=false + window-bank register init
>>>>>>   * Per-chunk vs monolithic respond_mem allocation
>>>>>>   * WMI_PEER_MIMO_PS_STATE = WMI_PEER_SMPS_PS_NONE (added matching
>>>>>>     ath12k_setup_peer_smps; doesn't help)
>>>>>>   * FW image variation (c5 and c7 both fail identically)
>>>>>>
>>>>>> Specifically NOT involved (we have evidence either way):
>>>>>>
>>>>>>   * Gunyah -- X1E80100 is reportedly run in EL2 without Gunyah by
>>>>>>     users where ath12k works; so Gunyah isn't programming WLAON
>>>>>>     access for the Q6.
>>>>>>   * SMMU / pcie_smmu -- pcie_smmu is status="reserved" upstream,
>>>>>>     pcie4 has no iommus property; PCIe DMA bypasses SMMU.
>>>>>>   * SCM/PAS -- ath12k's PCIe path makes no qcom_scm_* calls.
>>>>>>
>>>>>> Question: what subsystem inside the WCN7850 firmware touches the
>>>>>> WLAON region at 0x01792000 around 2 seconds after the host sends
>>>>>> WMI_PEER_AUTHORIZE?  And what host-side configuration (WMI command,
>>>>>> HTT message, MHI state, etc.) primes that path so the access
>>>>>> succeeds on Linux?
>>>>>>
>>>>>> Even a pointer at the right Linux code path or the right FW-side
>>>>>> component would unblock us.  We have full RDDM dumps and dmesg
>>>>>> captures available; happy to share off-list or as attachments.
>>>>>
>>>>> please help collect ath12k successful dmesg log and qwz failed dmesg log for compare.
>>>>>
>>>>> Please enable verbose ath12k log when loading ath12k driver:
>>>>>
>>>>> If you are using the latest upstream ath12k:
>>>>>
>>>>> 	sudo modprobe ath12k debug_mask=0xffffffff
>>>>> 	sudo modprobe ath12k_wifi7
>>>>>
>>>>> If you are using an old ath12k:
>>>>>
>>>>> 	sudo modprobe ath12k debug_mask=0xffffffff
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Marcus
>>>>>>
>>>>>
>>>>
>>>> Hi Baochen,
>>>>                                         
>>>> Thanks for coming back on this topic.
>>>>                                         
>>>> Attached the OpenBSD dmesg, with full ath12k driver debug logging
>>>
>>> the dmesg shows several WMI_INIT cmd instances which is not expected, because in normal
>>> operation this command should be sent only once.
>>>
>>> cat dmesg |grep -w 'sending WMI command 0x1'
>>> May 12 19:35:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
>>> May 12 19:37:20 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
>>> May 12 19:37:41 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
>>> May 12 19:37:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
>>> May 12 19:37:50 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
>>>
>>> other than that I don't find any other clues.
>>
>> Yes, that is specific to the OpenBSD NIC framework.  I've just tested
>> a quick hack with which the WMI_INIT cmd only gets issued once, but it
>> makes no difference to the firmware crash.
>>  
>>>> enabled, plus the resulting RDDM binary after the firmware crash:
>>>
>>> how did you collect the RDDM binary, seems not in the right format, my tool can not parse
>>> it correctly. Looking into the binary, at least the magic 'ATH12K-FW-DUMP' is not present
>>> at the very beginning.
>>
>> It looks like ath12k wraps the raw RDDM dump in some ath12k firmware
>> dump structure, which we don't do with our driver.  I did write a small
>> conversion program, trying to generate the dump which you expect.  You
>> can find the converted dump file here:
>>
>> https://nazgul.ch/pub/qwz0-rddm.bin.out.gz
>>
>> I hope you can load that in to your tool.
>>
>>> And from which Linux version you take the ath12k codebase?
>>
>> Well, that is a good question.  qwz (the ath12k OpenBSD driver), is
>> an initial clone of the qwx (the ath11k OpenBSD driver), which is
>> functional.  On top of that we did changes, of which the recent ones
>> did sync missing functionality from the Linux ath12k driver.  We did
>> already do a lot of comparison between qwz and the ath12k driver, but
>> we can't spot an obvious difference which could explain the firmware
>> crash.  Obviously doesn't mean that there isn't a gap between qwz and
>> ath12k related to this issue which we don't see.
>>
>>>>
>>>> https://nazgul.ch/pub/qwz0-rddm.bin.gz
>>>>                                         
>>>> The command sequence on OpenBSD to re-produce that was:
>>>>                                         
>>>> ifconfig qwz0 up                        # Bring the ath12k device up
>>>> ifconfig qwz0 scan                      # Scan for networks
>>>> ifconfig qwz0 nwid nazgul wpakey xxx    # Start association
>>>>                                         
>>>> Hi Max,
>>>>                                         
>>>> Since you have Linux running on exactly the same Samsung Galaxy Book4
>>>> Edge 14" laptop, where ath12k works, would you be so kind and also
>>>> provide the dmesg output showing an successful association with the
>>>> ath12k driver debug logging enabled?  See above how to enable that.
>>>> That would be very helpful!
>>>>                                         
>>>> Thanks and Regards,
>>>> Marcus
>>>
> 
> Hi Baochen,
> 
> I just want to quickly let you know that we did overcome the firmware
> crash.  The culprit was that we did
> 
> 	#define RX_BE_PADDING0_BYTES 80 -> instead of 8
> 
> which did break the hal_rx_desc_wcn7850 struct:
> 
>   struct hal_rx_desc_wcn7850 {
>       u64                          msdu_end_tag;     // offset 0
>       struct rx_msdu_end_qcn9274   msdu_end;         // offset 8
>       u8                           rx_padding0[N];   // <- the bug
>       u64                          mpdu_start_tag;
>       struct rx_mpdu_start_qcn9274 mpdu_start;
>       struct rx_pkt_hdr_tlv        pkt_hdr_tlv;
>       u8                           msdu_payload[];
>   };
> 
> With that fixed, the firmware error is gone, and we can now receive
> and IP from DHCP.  We're working on getting the TX path work next.

OK, good to see it gets fixed!

> 
> Thanks and Regards,
> Marcus


