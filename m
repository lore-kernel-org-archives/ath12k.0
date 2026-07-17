Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEE1C44514
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv8jlUmjaJRUZYYxeNzZvFoNCdmvWcDQlPQfu3CXgjA=; b=uhzmLnrMY8izW5fuD+sOYcttUv
	98DPpdfxiMeCB7hqmt4sPkRoSQHiGz4NBvaV7EHyikoLz5Nary9wLCFbfaaayra5VIsUyZ6hcM0li
	vrKjbvIploJY6tGW9AME2P4FHl0U1NertMekQvSwKlx2gRiga1lhhvZr2mO9GpFfhyk2t5uh5YRmx
	knScDS4zLj6QD4HZ+l5/jGVx6JR/G5MekIHKKPC7NEPvlRn7ScbozvLOXHL1x3ra68i2mx6pCly8M
	b+dr7TuVMwuC+poU03B92zTzOcXmaAW2wadq8SG7tJnJ5zjZF5pc77wMdwHGJ9tCo2OMnh1x3BaKr
	kiCxkK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFq-00000001Ux3-1cQt;
	Fri, 17 Jul 2026 07:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFn-00000001UwJ-3VhP
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 07:45:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ci1u661898
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 07:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv8jlUmjaJRUZYYxeNzZvFoNCdmvWcDQlPQfu3CXgjA=; b=AWwz2P7kkJfuOybl
	b0WIzyL1mam766eYMDWU9EqulLP8ez+xXNp2HBIraMZjIHbdZg0hQQQ32hUpaJS5
	lvr3B0i2ksH91FkHm0Chn7DfpuAbmMQl64AeWzl5UfIPejbq2y0KWfiBRXSheFbN
	KTbY1GNSV9zjm6GFRFQDnQvWQSKrFMeL5huBU+egW1hcRkAYX5PK3KogOY2EAPH4
	qOijl5vUgsrrILAcCJaotdktHrvKQXmVLG8mqwovDRP8yjGmZWPEOKmV2XRnI7sm
	KY0HT95ZskIdqdViJL4/Em7ICCHPMQ+1sVuBZjgB5U/CTMWzBcajuoCtpv2ZH+u9
	uKmy3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9kakv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 07:45:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so103803485ad.1
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784274302; x=1784879102; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gv8jlUmjaJRUZYYxeNzZvFoNCdmvWcDQlPQfu3CXgjA=;
        b=UNZXPRrX061jB6zrpS9Om2cR/dupTZUh1ACAG0z1ODFut8M+81BbdpoXsqB9YTxVCV
         B4yRkvydi5j/YzgGYO+9v1ziYUS9/6XxhKZuHMY9gvN5Srj/ln/5MJot1VuYDpR1Dgcs
         zJwuOxJ8E99oDvZG7I6B3xblgV/34jv9AY1bSAtJxDj+Enuv7WIZAwt4RYLgdhuTvPlk
         CBSxexdAh5GzBvjA3XxjWgx8IPShSpcMz/YGiHcTR+BwQfDNu2/AN0JntUrM1BrH97QL
         vIO8hncdih4RA3/lffNTbmF2h9ZvVVeOG4gUNvJhpVBAJz+OXm7WK8q/sUWnv3jBIndC
         OJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784274302; x=1784879102;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv8jlUmjaJRUZYYxeNzZvFoNCdmvWcDQlPQfu3CXgjA=;
        b=FWbn4BnW8LUao6emy4azPknL8r9Q4+dY6ujo7bRoYAkQ78c1Yh+whPpC5mnlB0t3vG
         Q6zUmNCDBENfIyyBRoe9YcZvv3sai04KFfUqaPiCy5dr+MhIYBaA9H7IZZ2ASU6nAghi
         vkZWrHzxlZG+LazRaNONMWvE8q9ZdntgJbXN+Ppwb/3EeTS5vfr7LgsHSzJfo8ty4xgg
         SpzCaImURYbsnyuCC8TlN1apA8P9bfHbxx0qU6PmtcelZuNGSCzkqKKRsXUVs3FYx/KY
         CcihArdc4ozrvmakbS5/uil00ikoa0hb5tOGOPwkNnx1UvcW7oUXf+RHx+MROXSYxVGU
         kDSA==
X-Forwarded-Encrypted: i=1; AHgh+RpDP4EvJ92hLDMtgQ8fH9oRuM0d0iekkmvz4/jETT6BpGUt0GdKBEuqD0SqNZEBOu1P/dt5ui0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfn5OyllwuyrMuIRdABLsq8ZdtfFmkKp4jlPawDhXZbv/eDu+t
	JdFu+K6Jw4K1IbxC3TvkjHIh61JEjeKp9qlMbwr8WCJQ6WGuWG0cIFViJ/J1SJgF5GD4CWq/Uyw
	sc89am5zf5HcP/eaWut1a0DCbZqZvzF02yK9qLTWRUWHZJggXDmkTjjKECoXvxn+gzvlSb0OT
X-Gm-Gg: AfdE7cmM1Ro8rD7eJ9dL20nTcVSy9w1/bk76E1UPoB57Qf/Dx3rxNbzGS4HaU1R1R0U
	8JueonvAVOy+E2P0roipCE6iqZ6Z8QMII0NSl0NFhrWQrvAY0LvdfRofvq2/J2LdA2G96s6+d1M
	TSOVp7dFmzSOS5aNgALOwps8Dkq39ciz+6EtKoZLoiSPtbu5sa3Ox2m2nNf5gMePQroa9/KdmJR
	9Mdj54fk8vBWvgW1GgcyyqIGV7o8Vp81YJby7J734qR9KnFMV1EG+337Aq+rzQrPHEAqTP9Tw5I
	UX0QPj/xyMxmG1zRNkjG2p0TazVvq2aIk5+Fy8xDwarjvnGC9qBA3VNySQokqZfwm4zh3LXopwS
	1KgFq16KKmkKMNs58UI421aLYdoSFyyF16Uhu3FoIK2DXvElHqmcBfaOcKty+2Z5mNeQnkOt+
X-Received: by 2002:a17:902:cf12:b0:2c9:97a7:71af with SMTP id d9443c01a7336-2cf349ed678mr15082795ad.42.1784274302515;
        Fri, 17 Jul 2026 00:45:02 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2c9:97a7:71af with SMTP id d9443c01a7336-2cf349ed678mr15082435ad.42.1784274302047;
        Fri, 17 Jul 2026 00:45:02 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm6140005ad.4.2026.07.17.00.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:45:01 -0700 (PDT)
Message-ID: <1bd4f373-365c-481c-83ee-94a304747cc3@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:44:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN785x firmware resets regulatory domain on resume
 causing ~7s reconnect delay
To: Stian Knudsen <stian@pokerfj.es>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <-_iDJ_M5RrqACWB0qmtleg@pokerfj.es>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <-_iDJ_M5RrqACWB0qmtleg@pokerfj.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59dd7f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=FhP73pfYAAAA:8 a=VwQbUJbxAAAA:8 a=6fZViXMljCPv9DoXK40A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=KIQ-tT4kkC4jZbePahcr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX//sRJ920TOZL
 wfc+u3M5ssRYpva/15bA8w0lgHVHmKD/oycTWt+Y8ZlI8nmE0gIHIdlqBhumiPr1x7p5sYmPxn4
 mPT9qQjBMC2GwwZf6iGC8KoNj0zDFvBKjjb6uAdDYVMvruXeG8E2TDZ/YkHMAz1ye3kEIDFlryY
 y5NGLhbKU+j0HcoPsJ+ziv1xanC97AHQ/q1567v5zqQidy1/fG7ke2RUUHLefoZQXDJRyP+5TXd
 yA7n0E/+elsF+TRdkdLmS/6uh5R+nFv+hGkj1J+nUyGOmnPJFzpfLzxNbeIlw2syL3U7b0arNnn
 RWiFsroQFj1mx9A77mbCttdigVWtzDHkBI70e7hcrKz+8UUYRoQXOSmZNlzaiao8pWeNwLw13br
 6SmSiP9o6oi04OjdpZ7tpwWkuyhoCMq2rYFi16XVn+NhIIeZISNJ+1PUR21OFKVCoWttqhIkkl8
 qQHzAIHWooEcid84IOg==
X-Proofpoint-GUID: l0eXooGu_NLeP8K4aZE0uetxnuSPhAgg
X-Proofpoint-ORIG-GUID: l0eXooGu_NLeP8K4aZE0uetxnuSPhAgg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX9NrtzVCnCmUO
 ZWcLE1ZNnd31dHvJsRzR+uC3oso04SBd8EJJGJKu2Klsd+gaX5IE3XuGZ1qt9xunnRPNtvm7xSW
 /aldHwZco8DSRA/p+qWCHsHN1s+Gjfk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004503_890236_CC34F038 
X-CRM114-Status: GOOD (  18.93  )
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



On 7/17/2026 6:35 AM, Stian Knudsen wrote:
> After resume from suspend, the WCN785x firmware resets its regulatory state to
> WORLD and takes approximately 7 seconds to re-discover the country code from AP
> beacons. This causes a consistent ~16 second total delay before wifi reconnects
> after resume.
> 
> This is an improvement request rather than a crash bug: the driver currently
> contains no WMI code for saving or restoring regulatory state across
> suspend/resume, and I would like to ask whether this is feasible.
> 
> Hardware:
> Lenovo ThinkPad T14 Gen 5 (BIOS: R2LET40W 1.21)
> Wifi: Qualcomm WCN785x Wi-Fi 7 FastConnect 7800 [17cb:1107]
> Subsystem: Lenovo [17aa:e0e6]
> Kernel: 7.1.3-arch2-1 (Arch Linux, close to vanilla)
> Firmware: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Kernel taint: 0 (untainted)
> 
> Observed behavior:
> On every resume from suspend, the following sequence is observed in dmesg and wpa_supplicant logs:
> kernel: ath12k_wifi7_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
> kernel: ath12k_wifi7_pci 0000:02:00.0: fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10 ...
> wpa_supplicant: wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=WORLD
> [ ~7 seconds pass ]
> wpa_supplicant: wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=COUNTRY alpha2=DE
> [ ~9 seconds pass ]
> NetworkManager: policy: auto-activating connection 'SSID'
> NetworkManager: device (wlp2s0): Activation: successful, device activated.
> 
> Total delay from resume to connected: ~16 seconds, 100% reproducible on every
> resume.
> 
> The device advertises itself as self-managed (phy#0 (self-managed) in iw reg
> get). All standard userspace methods of setting the regulatory domain are
> ignored by the firmware -- iw reg set, wireless-regdb, cfg80211
> ieee80211_regdom modprobe option -- and i found this blog which documents this:
> https://www.julienturbide.com/blog/wifi-7-linux-ath12k-wcn785x-regulatory-domain
> 
> Grepping the ath12k driver source (7.1.3) reveals no WMI code for saving or
> restoring regulatory state across suspend/resume:
>  $ grep -r "regdom|regulatory|country.*suspend|suspend.*country" drivers/net/wireless/ath/ath12k/
> (no output)
> 
> The firmware resets to WORLD on every resume and must re-discover the country
> code from AP beacons, taking ~7 seconds.
> 
> Is there a WMI command available in the WCN785x firmware to cache and restore
> the last known country code on resume, avoiding the need to re-discover it from AP beacons? If so, would it be feasible to add this to the driver's suspend/resume path to reduce the post-resume reconnect delay?
> Full dmesg output and wpa_supplicant logs are available on request.

ath11k has the same issue and there is a commit fixing it

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f0343b7b8710436c1e6355c71782d32ada47e0c

in ath12k, the same command/function (ath12k_wmi_send_set_current_country_cmd()) can do
this for you.

> 
> 
> 


