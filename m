Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43028CD37BE
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 03:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSbv6RWKhiNiVnUCEsPgSeJb67roaycaVI8OXa3HCvU=; b=iFKJhPju1UfrJ92oCxD7uuybmd
	hLZ4hdZnvfGqBzchBc0+5l0QfPiCRvc7gNwVPrJQwMc9okvCgyYUya5hvlYylerN0yy9WHGRgTQ4X
	lT0dXOYshJN7oaOzZXqjbq7QhgW5QULT5g4rYls2DkuLYBvp2HTfjA30OUDpQZZHtyIF69nb0tmJa
	ckOak738f2CgxhINrajrbmYpSgWcQj0DXI1y5uL3OaRgYFvfqjYhCgWqOAjYEAzxcoVKOUWuklIZj
	F1DftlfYZdl4Z+pYkZSNQis61hWu6EerqpOFdQTvKwpq4dXHT2VUMQwsScHnYMBBcImlwbMrviJyy
	+bTMoTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdwl-0000000FO5C-063t;
	Tue, 12 May 2026 03:38:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdwi-0000000FO4g-1r58
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 03:38:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6R5A1183965
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 03:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSbv6RWKhiNiVnUCEsPgSeJb67roaycaVI8OXa3HCvU=; b=HhhtIRtlZlemkC3C
	RJ3LWMcq6eRtJnHzhDkUDy6ljWmw4WPNUJn6yxKQ+n6PkKfPvVkBhE7bGslAl95R
	BxaADWsJq4szYwlKNHS7sMmkrgQnQuoYqGIRUQzWaDSB9R2etAb6u8LKOInEcwBL
	SlvN5IvLl3tIUgmy8ljwmEIDHEbatxcJGcnhCZRqgAfAzvN3MNTHI95uqjAqKJoP
	Wa3Wsuac2hvknuV+Bdg5BEsxFliM/7L1PzzvDvogFFWUGm8dScsBO15BTPormm6z
	GIYlrKFAJuqCkgdySUIlJ11d5CuTSzda8dqlQuL0IOEd1AiwVZDaK0EYeXR8gJ6L
	CixBVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy99p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 03:38:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837d0d71c61so3025169b3a.1
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 20:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557091; x=1779161891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSbv6RWKhiNiVnUCEsPgSeJb67roaycaVI8OXa3HCvU=;
        b=OCX2AqpOQJJsZjI2M6ZWG2/pPPCh8YLu1SQ2nu1rO2EmIrOO8N19a7kAhTY69w4Rby
         7DX53Lx7oRdVevDp8UaJ4AO0oVc8zAga8v1Uq37q7MAyIaY0FcpmgY9j6uCw7gu6CCBF
         hlBxI9M5HsmuOPW6auUvm4weuhEAS2Hq2ax7lx0A88NqKIVqPeTNCQ4Wa/mvdOUbcbOA
         eQkANYxXfamaLUlyzCLmczwZOP4Nz0aU0LWsblFetoSm5kfggmqogtUxDzIjr+3y1K2U
         VHSY70KqZxnz0GRkE5F74sxJE9SFb8Kz8POlOq4ryIw/5YyUG7O1VDJPEnfBonVF6r8+
         ZO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557091; x=1779161891;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSbv6RWKhiNiVnUCEsPgSeJb67roaycaVI8OXa3HCvU=;
        b=me7dEsnLTE/N9YRhVKhfFXtk5C+Beduj1PE8CHdhd7Ofz6L9bFrxOQ8E2CgWYwOh8h
         xpeOV7QSLfZIPoqWjTgxFBVdWZtqTabShuEyazqqxN3ZMhGoZqOBwY8CcqpxzK8q8HzT
         g9ZNKurYNX89wrixp5NdoepS8xURX2cMl5DqBT8fMTe+0O+fOFdF1zkjN/8C2aNTKaG/
         cLv1LhN+nQ2pSDC3t9s8AhN5I4pKozYIevK6T1hMzkyYXFXwf/NhcI9uPMeaCfgdCUik
         uLXoNwIGj5MqSaNakmnbhRlFRYlY+LXiXiY1hFQj9v+DuO8/8C2e6nZwJa7TjrVD4asG
         KRIw==
X-Forwarded-Encrypted: i=1; AFNElJ/3IWjCwIvl5pq4ERHM/BRf7zdvB6aO2p+1WsK8LuZ79GZ1BlrcPqPShNqkDs3b9h7Ny+G16aY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww/04ugwjGa0Wd0/P8MpTJKIMjDw2h/W7l17kjJx06LZ7kC1yN
	MBQWq+3C5Ci1iMe1pKN7tO5uB7FeoSuCFbi/PxwV/UtRmXF8csEwvnaZ5yjGBJR+SKkkzsoLlzs
	QznOzWwBC+grfQVcZZHWuRvN49bOsyU5kprAfTxsKuqLuDxSU5REX4KP3wNzQA07G
X-Gm-Gg: Acq92OF2aj12jBGRFd785zvD14keYpR/nQu2tum2cJ8saJJI1lmiRaIh8WP/8kHopiC
	lCckc0IXtyo65dIBV6+Xv0E1UhrAytX6GB9PLzPTbdPYTZ82QiSyn9X23z0L/V9NmqYzFDh62Wz
	QyeGc+emseii28fyYAzAutCydKFXa5oADrlZ3/FEbz53CsKk+0YkJqMq4oybjsaOZTUWPikPE3c
	JlXX61PjhiboqBD3aHAwINfCc/JTRTrz2EDT4eW2NbsDTx36hyPkB2hlS966Qye76cUQv+feigH
	W5pKu838tfu/GB1p6+JWDBa24fKkjmOw2yXuT8Dnm7hFtF+wnksDzVx10Z+4IJdpr51g7sqjQ3K
	Jg9u/tVeRrKuna11axPwYfpDmJ9pMTmU+1YS0gRrRUQhMlpS1267pfKAdUPsYVoFt4qO1eSv1mD
	H5G0Md6AxyXFCBI+Rojwc=
X-Received: by 2002:a05:6a00:4605:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83e395505ffmr12351678b3a.2.1778557091002;
        Mon, 11 May 2026 20:38:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4605:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83e395505ffmr12351648b3a.2.1778557090517;
        Mon, 11 May 2026 20:38:10 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm22441087b3a.19.2026.05.11.20.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:38:10 -0700 (PDT)
Message-ID: <0b450204-9afc-4ba1-b9c5-1876b5a7078a@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:38:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
To: Marcus Glocker <marcus@nazgul.ch>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: jjohnson@kernel.org, kvalo@kernel.org, manivannan.sadhasivam@linaro.org,
        Mark Kettenis <mark.kettenis@xs4all.nl>
References: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CrNJDAEY2JIGWSMGl8dfZqKNo1vojQXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX48LOEL8MQ8M/
 17ABHrnlMrTWDXO3ApCzxAo70VHsgCLgn+7HVYenTiWvOI+Ji7nczuqypXZWSvnKRq+yOvn7Hsn
 Bp/B8BzVnOAJ8Xm/+p8Le82liAHhn0IpinV4EkYYS4mgj9FjH+RT9Y2rmwwiY3UKqixhsg2LU29
 qc8o4mX7kg2ii8ZNw021eWKo3xfKLt+UDJnQYkdLYiuyvFdtHX/FZ9S5CLPzzuhiTTlNJ/GmX71
 htY8fuuKwmsKKWYbTRFWREFxMJu6VdBhp2EYcyGR89VbYoWC+ve/JdcefjJjjSeOi+5Yu8i2wyz
 IjJHbKY3uN2tssGP4A8Ka6YstGw2DbZG414yNWFhLM+1kB2huAezt3s7LSvG373P+e5UQEy5V3m
 ebq37xjCHjFbmx2OTgqU6EkJpIhVemom4G028bUr9LZIPC88i8yZZqutcaWjtI9NhlsFbc9+Owx
 oSyyONEYv6/6HNcXSGg==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02a0a3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=svG3Jch8njoXwoTW5vUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: CrNJDAEY2JIGWSMGl8dfZqKNo1vojQXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_203812_491362_ADF3164C 
X-CRM114-Status: GOOD (  18.60  )
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



On 5/5/2026 5:08 AM, Marcus Glocker wrote:
> Hi,
> 
> We're porting ath12k to OpenBSD as the qwz(4) driver, targeting Samsung
> Galaxy Book4 Edge (X1E80100 SoC, WCN7850 hw2.0).  Scan, auth, 4-way
> handshake all complete; ~2 seconds after WPA2 AUTHORIZE the WCN7850
> firmware crashes deterministically with:
> 
> 	dlpager_main.c:147 Non Page Fault Exception cause code 0x 23
> 	at Address: 0x 1792000
> 
> Cause code 0x23 isn't a valid arm64 exception -- the fault is on the
> WCN7850's on-die Hexagon Q6 DSP, with QURT's generic exception handler
> (which happens to live in dlpager_main.c) printing it.  So this is not
> a host CPU fault.
> 
> Per the RDDM segment table (at the start of the dump), VA 0x01792000
> is the start of the chip's WLAON_DUMP region (size 0x820).  The Q6 is
> trying to read its own always-on hardware state region and the chip
> refuses the access.
> 
> (Samsung, Asus, Honor) with multiple FW builds.  Currently testing
> with WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> (fw 0x110cffff, 2025-06-25) -- the exact blob a Linux ath12k user
> runs successfully on the identical Samsung hardware.  Same board-2.bin,
> same compiled DTB (upstream hamoa.dtsi based).
> 
> We've field-compared qwz against ath12k and ruled out (byte-level or
> wire-level):
> 
>   * QMI host_cap, m3_info, wlan_cfg, wlan_ini, bdf_download (all
>     fields including ce_config, svc_to_ce_map, shadow_reg_v3,
>     feature_list, m3 paddr/size, nm_modem)
>   * MHI bringup ordering (BHI -> wait SBL EE -> wait M0 -> BHIE)
>   * BHI/BHIE DMA coherency
>   * ASPM disable before MHI start
>   * WLAON_WARM_SW_ENTRY zeroing + QFPROM_PWR_CTRL VDD4BLOW clear
>   * static_window_map=false + window-bank register init
>   * Per-chunk vs monolithic respond_mem allocation
>   * WMI_PEER_MIMO_PS_STATE = WMI_PEER_SMPS_PS_NONE (added matching
>     ath12k_setup_peer_smps; doesn't help)
>   * FW image variation (c5 and c7 both fail identically)
> 
> Specifically NOT involved (we have evidence either way):
> 
>   * Gunyah -- X1E80100 is reportedly run in EL2 without Gunyah by
>     users where ath12k works; so Gunyah isn't programming WLAON
>     access for the Q6.
>   * SMMU / pcie_smmu -- pcie_smmu is status="reserved" upstream,
>     pcie4 has no iommus property; PCIe DMA bypasses SMMU.
>   * SCM/PAS -- ath12k's PCIe path makes no qcom_scm_* calls.
> 
> Question: what subsystem inside the WCN7850 firmware touches the
> WLAON region at 0x01792000 around 2 seconds after the host sends
> WMI_PEER_AUTHORIZE?  And what host-side configuration (WMI command,
> HTT message, MHI state, etc.) primes that path so the access
> succeeds on Linux?
> 
> Even a pointer at the right Linux code path or the right FW-side
> component would unblock us.  We have full RDDM dumps and dmesg
> captures available; happy to share off-list or as attachments.

please help collect ath12k successful dmesg log and qwz failed dmesg log for compare.

Please enable verbose ath12k log when loading ath12k driver:

If you are using the latest upstream ath12k:

	sudo modprobe ath12k debug_mask=0xffffffff
	sudo modprobe ath12k_wifi7

If you are using an old ath12k:

	sudo modprobe ath12k debug_mask=0xffffffff

> 
> Thanks,
> Marcus
> 


