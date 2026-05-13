Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B8DCD343F
	for <ath12k@archiver.kernel.org>; Wed, 13 May 2026 03:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzFQPURAJd/FHEBgzmUHm+L4cK+hA3UTd6FrIYLfDuc=; b=rDNwLcpEOhoYiujOX905640O9r
	FmR5VZltR5lspp/gs4Ree8TrfJnmYLMzoAKeOVPT296rsBqyax6olxFpE1D5c68w3Cj0mc+jZrN1g
	3srf+ixxYA+mqkdv5AQJBi+h5yXQZaN2CXBv5+qOn5qNPJ0piZsF8TbtLRTAbKMg9hJNldEQF5jAt
	2pM+DKgJe9KTif8ehHa+j0KPC0SPRFc/gGc7Quq1iEfEx6AzSglQp6kA6jxS+Pcj3xfErEVk4rcMI
	GRlakKwGHh+BvYgPHIygEGC5U5f80twA7jEtPJ5HNTtho2RgQICdCO4dVu5rA3UDpJbiKcHdJw7ko
	V5odZ9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMzuN-000000010oP-3l8g;
	Wed, 13 May 2026 03:05:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMzuK-000000010nV-2HFs
	for ath12k@lists.infradead.org;
	Wed, 13 May 2026 03:05:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D08s0p713429
	for <ath12k@lists.infradead.org>; Wed, 13 May 2026 03:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzFQPURAJd/FHEBgzmUHm+L4cK+hA3UTd6FrIYLfDuc=; b=KgX/5LDHykwivH5q
	RAK/sEIK2SqAJM7TiUXRl8BTN9qXQIkLCaShfmWwpFpoB63R3LsEtl5asoeBoKlQ
	cviN+4FJqCsopMzmMi/+v4OHCLWLMpb0bxZGDta57mrhGLPCFirKRoe10fwI+buf
	d3ueh6w1+Z1Xv+ahR3vUkcfqa7vzUWkV9y/JvxsRYT8nDdQ51XVFtDr26qbd/RvY
	Hkm1ZdmEYEpWAKDOp3N0hiNFhMcc/pps1ag3s/E8GzvP34BVaMe3jelTXmEEj664
	igLFSaRWLk7OfyxU8c9D5I/mnR1PkaQlRExC45LsTu3BftObwqPelVw6NsfmyNCx
	OCjPxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1u04p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 13 May 2026 03:05:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8292a9605aso1500236a12.0
        for <ath12k@lists.infradead.org>; Tue, 12 May 2026 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778641511; x=1779246311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fzFQPURAJd/FHEBgzmUHm+L4cK+hA3UTd6FrIYLfDuc=;
        b=TxS69pvhq3NZFkFWIeEGMlQ0erlhfnpIeQil0zwAYddahuQ5+i/xdHRM7MOWMnMgNy
         2sF1VllGQ26DFZzi/vvxj7Cn4JAqk0pFwtBV1xmOFavyJsmsPnKI1pFSEBp+Pgtzbvto
         RHmy3xXnwLZoyVhFP9MP1cqy89xJIg4bT+qoCBSpkpZxLa/KeCVvbf5rcmNNnpEzkVyZ
         TFD4KxxVD02fLrOm25WO4OQg6uaheRHJzeyEnseaZ2qk8WG/Nv38BguliHv04INGevzx
         5jr4n8xoQm1RAAU+bmSgNj5vnpI7Q0P8+qoRzc9cDt677GqjLNO1i6qQWma5cZRcMnVq
         wVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778641511; x=1779246311;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzFQPURAJd/FHEBgzmUHm+L4cK+hA3UTd6FrIYLfDuc=;
        b=oqoNBZTPnMiv/g3kIP/xZekQ6G+UJbiLXWe4uJkA6Ftrm3TPXMBfMppD5kAW3jCSmG
         k5B7CoUsh9wFCajzLzaeNbf6csZ3bOt1KDgBI8kLCKeB9zoja+PbLnSG42pgatyAHk0R
         VX8Z5UQqGvPWngawxu3ini/AIyvvVRLrVmUc/cCpfdnl3Wybw7O7AKpxmwC5KkN2ga4b
         GSoypIFqVezw5OMg35stYQKRD9XiUzZAspBLoIkHDeQOWi9304t6mIsuh1tuTTGap1zW
         7OMOypl+bMbJJI0rRgXhQyNSaEdBUG0+nESRl9jwyE6dnpJlzthFZffKM7d0KEF8aOgR
         U7lg==
X-Gm-Message-State: AOJu0Yzx9JNZOE68/b9koUNBXD1Kv/fN++lTJC59T4lp9tKVMtg6eNUB
	zSMfs9FEm8DuDrWkwZOoYV39XaFa6VXSOxo3NID7dkZKyEA+5G7/NYlOuCW2TvS6kPSsgf2zUUv
	gNsVH4dVneeLJVKScomrlxw9IZwPNDM4nR62Wb7mLLwqxQlUFalhJeld82oyCBm4/nIuj/p38
X-Gm-Gg: Acq92OHKN0jBNBb/220ALotpzYvkIRlVgQ6BqjdaDOwnpe/fcsEMOFtZ2js5fPacv+s
	0nTHrOPil1xemWt0fN4lBgK5FbTmiseyLA0S6mZ6UWnFq5PrQ0G3gXc3rF2saIuwBco1BGac3PN
	QxaYzNIU2QzFcrsI4ui0koxQfK/hgOV8EkGxQ28g16e9cHFrsg8rdPGpMYTq+TlgXlszOxQ/fZX
	P0wOMk4kY3wRyE0n04WhJbYttaRX/uk4D3eGto4+NVztlY3vtokqgqms3jEX9IsWuh7SGw7z6gh
	r6q4goa6awFO8Z4hSViSsRM6oMprZCxekPcAadCTRuseLXOgDxNVBfS8l/NktUXK2xGFhpdpEB1
	AhGKQgBpZTJA5mpGHoIfxa2xShn7d0c7I2jLP0d2NTcbUGEgqbYT41GDoCuQKWSeyKF0x1DpRDg
	tyd1P8onSpitbwDD3ZOTA=
X-Received: by 2002:a05:6a00:f0a:b0:83a:4846:90bc with SMTP id d2e1a72fcca58-83f05d755e9mr1009018b3a.48.1778641510855;
        Tue, 12 May 2026 20:05:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0a:b0:83a:4846:90bc with SMTP id d2e1a72fcca58-83f05d755e9mr1008961b3a.48.1778641510236;
        Tue, 12 May 2026 20:05:10 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a8125sm24830728b3a.61.2026.05.12.20.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 20:05:09 -0700 (PDT)
Message-ID: <92ace4b9-143e-4962-90fa-215a22e24796@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:05:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
To: Marcus Glocker <marcus@nazgul.ch>, Maxim Storetvedt <m.tvedt@tutanota.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jjohnson@kernel.org, kvalo@kernel.org,
        manivannan.sadhasivam@linaro.org,
        Mark Kettenis <mark.kettenis@xs4all.nl>
References: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
 <0b450204-9afc-4ba1-b9c5-1876b5a7078a@oss.qualcomm.com>
 <tzkh5t3bmiqff67g72rihapizz2u2dlj4xfrr324d6yg4rtltt@3qrsymzw7c2c>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tzkh5t3bmiqff67g72rihapizz2u2dlj4xfrr324d6yg4rtltt@3qrsymzw7c2c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 04MBy9uMlg8LP6b80WV2bx-6QC5C-da8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyNyBTYWx0ZWRfX/NmpgwDEeF6o
 QyZ+N35IoSIUZM2ZeXZgfTIycovGyng7Hou7SITw/Km+nYBNISo810Zvg4Hbyvm8xphnUQNTxZ8
 VqMN1H70ByJK11SXdvMvudlV9bI7fSuJZDelSOVMHtuXoP3oSVft/AKVeLzF71fQf0hpnS6uwdP
 nLl71FU9acvPuy6x2k2CP1CnsT7i5I9xSZzJ8nfVPzl1g6cHlkU5XuzATihxQqbj7dHYJOKgTJA
 k2yIAakPS51Vz8Ve+KGUMkaBgkGKf44jUdS4tJL1QBdqu3QA/7he5Nclwguz+w9KX0eI4sl/Bld
 Qj2n4NTcX2/anjWnGQlf20x9u1u3NPnDxT+SNjmXkjlhZ9bK4hFjVek7uGDXHiRZtgG3RnK4T4S
 K+Xqu70ogPENgaYvPGXXBhEiaCI618k5SF4LEKFT3A4/fRfQgu4PGCEgnzeugBx3rF407KXQHSa
 bakmrvcDwX6449Lloqg==
X-Proofpoint-ORIG-GUID: 04MBy9uMlg8LP6b80WV2bx-6QC5C-da8
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a03ea67 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=E_MRXsYlAAAA:8 a=uAqAdB2uIG4wdVJIxSAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=486ROa2Zizi0ivMXnIml:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_200512_609112_003099FF 
X-CRM114-Status: GOOD (  24.09  )
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



On 5/13/2026 3:59 AM, Marcus Glocker wrote:
> On Tue, May 12, 2026 at 11:38:06AM +0800, Baochen Qiang wrote:
> 
>>
>>
>> On 5/5/2026 5:08 AM, Marcus Glocker wrote:
>>> Hi,
>>>
>>> We're porting ath12k to OpenBSD as the qwz(4) driver, targeting Samsung
>>> Galaxy Book4 Edge (X1E80100 SoC, WCN7850 hw2.0).  Scan, auth, 4-way
>>> handshake all complete; ~2 seconds after WPA2 AUTHORIZE the WCN7850
>>> firmware crashes deterministically with:
>>>
>>> 	dlpager_main.c:147 Non Page Fault Exception cause code 0x 23
>>> 	at Address: 0x 1792000
>>>
>>> Cause code 0x23 isn't a valid arm64 exception -- the fault is on the
>>> WCN7850's on-die Hexagon Q6 DSP, with QURT's generic exception handler
>>> (which happens to live in dlpager_main.c) printing it.  So this is not
>>> a host CPU fault.
>>>
>>> Per the RDDM segment table (at the start of the dump), VA 0x01792000
>>> is the start of the chip's WLAON_DUMP region (size 0x820).  The Q6 is
>>> trying to read its own always-on hardware state region and the chip
>>> refuses the access.
>>>
>>> (Samsung, Asus, Honor) with multiple FW builds.  Currently testing
>>> with WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>> (fw 0x110cffff, 2025-06-25) -- the exact blob a Linux ath12k user
>>> runs successfully on the identical Samsung hardware.  Same board-2.bin,
>>> same compiled DTB (upstream hamoa.dtsi based).
>>>
>>> We've field-compared qwz against ath12k and ruled out (byte-level or
>>> wire-level):
>>>
>>>   * QMI host_cap, m3_info, wlan_cfg, wlan_ini, bdf_download (all
>>>     fields including ce_config, svc_to_ce_map, shadow_reg_v3,
>>>     feature_list, m3 paddr/size, nm_modem)
>>>   * MHI bringup ordering (BHI -> wait SBL EE -> wait M0 -> BHIE)
>>>   * BHI/BHIE DMA coherency
>>>   * ASPM disable before MHI start
>>>   * WLAON_WARM_SW_ENTRY zeroing + QFPROM_PWR_CTRL VDD4BLOW clear
>>>   * static_window_map=false + window-bank register init
>>>   * Per-chunk vs monolithic respond_mem allocation
>>>   * WMI_PEER_MIMO_PS_STATE = WMI_PEER_SMPS_PS_NONE (added matching
>>>     ath12k_setup_peer_smps; doesn't help)
>>>   * FW image variation (c5 and c7 both fail identically)
>>>
>>> Specifically NOT involved (we have evidence either way):
>>>
>>>   * Gunyah -- X1E80100 is reportedly run in EL2 without Gunyah by
>>>     users where ath12k works; so Gunyah isn't programming WLAON
>>>     access for the Q6.
>>>   * SMMU / pcie_smmu -- pcie_smmu is status="reserved" upstream,
>>>     pcie4 has no iommus property; PCIe DMA bypasses SMMU.
>>>   * SCM/PAS -- ath12k's PCIe path makes no qcom_scm_* calls.
>>>
>>> Question: what subsystem inside the WCN7850 firmware touches the
>>> WLAON region at 0x01792000 around 2 seconds after the host sends
>>> WMI_PEER_AUTHORIZE?  And what host-side configuration (WMI command,
>>> HTT message, MHI state, etc.) primes that path so the access
>>> succeeds on Linux?
>>>
>>> Even a pointer at the right Linux code path or the right FW-side
>>> component would unblock us.  We have full RDDM dumps and dmesg
>>> captures available; happy to share off-list or as attachments.
>>
>> please help collect ath12k successful dmesg log and qwz failed dmesg log for compare.
>>
>> Please enable verbose ath12k log when loading ath12k driver:
>>
>> If you are using the latest upstream ath12k:
>>
>> 	sudo modprobe ath12k debug_mask=0xffffffff
>> 	sudo modprobe ath12k_wifi7
>>
>> If you are using an old ath12k:
>>
>> 	sudo modprobe ath12k debug_mask=0xffffffff
>>
>>>
>>> Thanks,
>>> Marcus
>>>
>>
> 
> Hi Baochen,
>                                         
> Thanks for coming back on this topic.
>                                         
> Attached the OpenBSD dmesg, with full ath12k driver debug logging

the dmesg shows several WMI_INIT cmd instances which is not expected, because in normal
operation this command should be sent only once.

cat dmesg |grep -w 'sending WMI command 0x1'
May 12 19:35:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
May 12 19:37:20 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
May 12 19:37:41 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
May 12 19:37:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
May 12 19:37:50 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1

other than that I don't find any other clues.

> enabled, plus the resulting RDDM binary after the firmware crash:

how did you collect the RDDM binary, seems not in the right format, my tool can not parse
it correctly. Looking into the binary, at least the magic 'ATH12K-FW-DUMP' is not present
at the very beginning.

And from which Linux version you take the ath12k codebase?

> 
> https://nazgul.ch/pub/qwz0-rddm.bin.gz
>                                         
> The command sequence on OpenBSD to re-produce that was:
>                                         
> ifconfig qwz0 up                        # Bring the ath12k device up
> ifconfig qwz0 scan                      # Scan for networks
> ifconfig qwz0 nwid nazgul wpakey xxx    # Start association
>                                         
> Hi Max,
>                                         
> Since you have Linux running on exactly the same Samsung Galaxy Book4
> Edge 14" laptop, where ath12k works, would you be so kind and also
> provide the dmesg output showing an successful association with the
> ath12k driver debug logging enabled?  See above how to enable that.
> That would be very helpful!
>                                         
> Thanks and Regards,
> Marcus


