Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF2606A332
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I4pTuJze;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m26QvRg+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/MW1hYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xSEU4rv3mTj9y7lbLLWRimEMXP6ddAO//zUYfpXlwzc=; b=I4pTuJzewUGzrN
	onMdmiIn8SKK2yPyewSPrxDOPWriVLEDwH08mQolu9ZF+ax4zCDIFOgSjv8eBvuYzZ6EG4ehoV4Dw
	fJmWrWq/b9R5h4VMyoqxEYdxKYZ++zU7C61VfTzYo3xQH2SIupt+BZBrX4SWtC0i3rVrgavBTrzas
	fy8DgClAX4XnsNFX1roqGdOMvQPw7tvryADzP76wanv3UGAgdjAbLzgdJKk1SMe9pRES6UKMRoe0p
	XgoeiSG07iGMSoBo+DWtsbgLGxGRKu4xABqOrQBa8xTLeW32swHPiY6pmcg4DRI9GeEtWCDMvwxqP
	k4QPQDwYEAvm7T9O/tRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsq8-0000000AlnD-3njZ;
	Thu, 19 Nov 2026 03:29:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsq6-0000000AlmI-369Z
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 03:29:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B8RB3490633
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSEU4rv3mTj9y7lbLLWRimEMXP6ddAO//zUYfpXlwzc=; b=m26QvRg+9gfdcHlG
	J9TwYV+mRJt5C01DXTbTyY+WKebLmuAjGKn8WdK/46WwQGDzoU3KkA0M04uReH4D
	uYV6Wg82HffO17+LxfScpSyOySnJGXAFyQK1N56yFdeAH3K+29mjwbmXjsDKlDY/
	8KtnMxAfxFJfQYSDtRhjzSGLz0njoxZ5P00LMyKE+xxDcvhgRK2h8gS1lbbphbQ7
	YZl3ucDP/Ci6JysNWi64hRG332GUAYjmEne7mmR1tUsr46qO9DmMHxunpgJLyKot
	6JDEETpcjqGbO0oFHD9MEOmU1/fPjvIp4OA18JQSTdwfarunGs5ilnOAZHSSqoc2
	qzmH7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3babsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:29:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1259285a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 19:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795058973; x=1795663773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSEU4rv3mTj9y7lbLLWRimEMXP6ddAO//zUYfpXlwzc=;
        b=O/MW1hYKzFVlA55kYbDjlXsa4dAKzdUFOjQi7ofp6pvpLUKhWGXoA2iVsL2QnGTyJB
         3a4S1s0NsKZV9/z4g2+4g5gDubUD3/uKD/q4kZAH2/pVmAdhj3zSz5Ciu91HLxQun4rp
         4JL9c9OXwPe6DHe+Dmn2NDap1EgMMPSDykjHZ6JXHhMfjLwzmd7G5qcreL3EaC7Btu9e
         4GTYYobboxYOV4prt3sT8dROe47LKbGIvsywsoyotRovmIK+nowB5q+fxVABzZAcH3sB
         2yxVWEYHKVpNQfNlCdO408zr+FhzNG4s3AKCOuYE9UcC6MuioLl2I9OL2xKcgoUEf1cy
         pWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058973; x=1795663773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSEU4rv3mTj9y7lbLLWRimEMXP6ddAO//zUYfpXlwzc=;
        b=TTcKn42USYsEnVCU+QinTrg0W0lZ3HSD4tC1d4ka96EkMRW3DjCg2cGjI/nQjERYiM
         GSXaRMajs3+wnmDymIM3ARbffE2dx34WOBrvx06w/kd7nql8oIY0ZN9SZW1rVcOFIy6K
         EoL17WyQ27RAKbpGjVhTcv75zOvQrDWwEsWxa7MVuUKSCsLuepzC9xzs+tugikGtbb9o
         e1H/xfxnlVhGtmx8cbCUzeQa/uMYBHvFNOQa72b5TMWbNtvv751aLoTZHJokVhBRBut+
         YblSHPkW4pO5IVGh2HKkF/J/MCePeILmVGn2yfjncsakqTL5+Efcsuom882IfzRC/+rK
         10oQ==
X-Forwarded-Encrypted: i=1; AL+hErGNLl3ShyuLf0PIzCqKb+w1nf4xEwxSCYLRadzJ63m0Z6KetCnn2qf7/ChMK33JBrOcQU0j1aY=@lists.infradead.org
X-Gm-Message-State: APuU4Z96kChgJwe2+gyVHrqWxYzckPlrcaUqe7Z/3o5IKFyQ1pcxTl9S
	d0rXITilzqAYFRK2vxLOJhc6R8d48UI/tGgIBLi9dS6OcXR1DaOiNeKViNXfG8GDN5R4MdaJZ4A
	WgTUiCF7wbs6OZIYuhOZa9XMr+03I7WEHj3ruGiaIjj3LNl2+5qUqjiV/gvyZspbJqWJBdHwI
X-Gm-Gg: AZFdTZfrIcimVYOlNOYY+7TjiqQQK2fPEsUsgHKHdMhXOS8hpn5M+xuWKJJgCV32pNm
	5dxlvJqLto7NPnyjzoxaKMTGRTy5rjiCaMS4LRN4uiNL1RsGzZRH7l0k2oHNn8+PxwqmGluacNp
	hG01c1/ngyxY7qwH8Wi5b6pF6qumI2QPdhv588u92jPjqthYjEsPQ6Y8gxqdk6nJ7Wj6sv/eDLF
	UPMfO8AAx/5oe6+KkIUVfQr/Nn3S4ySvVyI5DJJW06rBoD4Brf/7FIJlKdjwr5KnguAWF9hQoli
	eeey0rRoEKBGxMPfRA/r668CoCHSUKi9nuW/8ugdZ8MQDLRs+SXjxuuEUZZ5QhzuyJX0qS3A95f
	Tf/cVHsWVW6zXabh9TcVhKN0W8u2BuFSJy3D+4jKQ0zilpCbpuSPyahMVMbCXaugOn1/YG7GgY+
	7st/1MmmpeP+p9icEmOgTZEbRQiohvABtXIHj5YSK7Rs1c
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr265192a91.9.1795058972615;
        Wed, 18 Nov 2026 19:29:32 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr265175a91.9.1795058972097;
        Wed, 18 Nov 2026 19:29:32 -0800 (PST)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm281164a91.7.2026.11.18.19.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:29:31 -0800 (PST)
Message-ID: <f08260b5-1b69-473d-b801-4692525705cf@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:29:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN7850: Missing board data for HP EliteBook X G2q
To: Tobias Heider <tobias.heider@canonical.com>, ath12k@lists.infradead.org
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <CAARv3RRwnmtaC7ZJVD0tEc3VVOWh8AaTpp+TuNzR+D1M-fQF-w@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAARv3RRwnmtaC7ZJVD0tEc3VVOWh8AaTpp+TuNzR+D1M-fQF-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TXsagiwivdOqsChuQtQAqRpMmdNr2RhV
X-Proofpoint-GUID: TXsagiwivdOqsChuQtQAqRpMmdNr2RhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMyBTYWx0ZWRfX6neYvmydwFTy
 bc2mYDPo6GuiSN2GJFXbqFXqpYndKgMRwY+vxvhO5abn9+XURoqyaPfPFEvXdigWKacEzyc/hbf
 eZg55zQVRSE69f20Bk+1Kd6AFN2+Tkc=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe6d1d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=WQ0gA7jgP4ZWlDW0vL8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMyBTYWx0ZWRfX8Y2RKAI0Qmzs
 W2zpKdcK8ISKCtgKCcTEhOXA3Es6jSr0lFRkdDSqr9v2tHItMuhDHaehUrmwEJRtTVY18o6jUYd
 Tc95b5pcm4U8Z0yknUSN4SV+k1HYwP7Y4YkbudwUTI5Bhj7ohw+FMxyJ4boOzcrS2JkyFcBmkkE
 OAd+1Zs6rMDs5D41bm7R6LRPYXjcBd0QTH2trOZn58UwcAk7kS7x958m/NDO/gCFfgyKHbz3Fp3
 kM5HIMQKkJlSZdRNlnuTuEunhUteFvGBgDkFnYPZB15LzUb6cyYL8iorRgkSAqnOQvgNxuRk+mP
 EQqdcElqovH1EVqRkafWZE0feig1fNt7Y3nA5iJdccnXT9q5Sy0fn5wuAwiK6eQVdKanksOxFkm
 OOr1I7nusyII+CBzxs28rNB8ArFL1RhamyG3ONFTu++UJ5KIigkNl/gLO5EvLJLGNjRsY5GD6B/
 a3R1w+3U7LFF1hdmgNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_192934_900399_224B91EF 
X-CRM114-Status: GOOD (  14.31  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 10:13 PM, Tobias Heider wrote:
> Hi,
> 
> I'm working on getting Linux working on a HP EliteBook X G2q Glymur
> laptop which is using a WCN7850 card.
> With the latest git linux-firmware I get:
> 
> [    4.939104] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x2 chip_family
> 0x4 board_id 0xff soc_id 0x40170200
> [    4.939109] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x1103006c
> fw_build_timestamp 2026-03-06 09:10 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> [    4.958280] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
> data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=103c,subsystem-device=8e64,qmi-chip-id=2,qmi-board-id=255
> from ath12k/WCN7850/hw2.0/board-2.bin
> [    4.958283] ath12k_wifi7_pci 0004:01:00.0: failed to fetch
> board.bin from WCN7850/hw2.0
> [    4.958285] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load bdf:
> [    4.958286] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load board
> data file:-2
> 
> I added my IDs to the existing e0ee entry as we did for similar
> devices like this:
> 
> --- board-2.json 2026-11-18 15:02:25.041598035 +0100
> +++ board-2.json 2026-11-18 15:03:11.825069089 +0100
> @@ -68,7 +68,8 @@
> 
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e114,qmi-chip-id=2,qmi-board-id=255",
> 
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e122,qmi-chip-id=2,qmi-board-id=255",
> 
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e125,qmi-chip-id=2,qmi-board-id=255",
> -
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255"
> +
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255",
> +
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=103c,subsystem-device=8e64,qmi-chip-id=2,qmi-board-id=255"
>                  ],
>                  "data":
> "bus=pci,vendor=17cb,device=1107,subsystem-vendor=105b,subsystem-device=e0ee,qmi-chip-id=2,qmi-board-id=255.bin"
>              },
> 
> This is enough to get the card working on my machine, I hope we can
> get it added to the offical boards-2.bin
> 
forwarded to internal team to handle this

