Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9C606A31C
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nN3o4NnM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP3QhQ37;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQT2FbIO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=; b=nN3o4NnMdC025d
	IjvBcHxSSi4VdndN2k1kqu2FQxDBaiEgeZCvN0pdHhFQW/CB/yTKHPaKoGxrBMTn8rqOQA8nTiDHa
	gWRiZoolj3l7QQMaz6H1SCAjIw5S+mws3VBcM3U93vKAegEu34gPTNk4sniYo0CNvPU6aQacjPmTx
	v4okb+Rcl1BAP+vpJ+letoeyh6Rw2ypFHdVZCmRWdDLcYsAaGNhGYu1F1BKO/+EjocB8dGET/6TJr
	sJD6Pk+qSRnntYuhb5yLkW1p/smNlzTGPkZlYWHCzIsnhL4uzNrA6TePVP3c36gNqBUubTlunz5LM
	hUpT+9jEa6Nrbka1wzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfeR-00000002i2j-48CA;
	Tue, 10 Nov 2026 06:48:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfeO-00000002i2F-3igm
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:48:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49uxV2294728
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=; b=CP3QhQ37x5Xrb+sP
	lPt3qJrXr+QpFKnHmANaF5/RurWfUCEG5FZECaYeGIpXhPuJ3gVmDg3c7LfHEet/
	/eKtGabKXnn60ymzRxXAkCMgMvwo57YBdNX43ubMYmVJ/0cBpT6O44Wgk8ORUC4c
	RCFPP6ZH8Etos9Nh7BVuo9+YIWTgoqP6B5H6Jxmodfkk8Zx6KslyC9QUCPJ4fYn+
	b3bHL67ykSbF0vwawjwRpPosVlsADPihocfW/ZzIMwqi0RPeMqoQBacz95OH9Pht
	7/An4udiUmOsmqCPlsXKjewId8Yh0+nkQlnV+dtPfCx52KVd455RS5j6h3C60spg
	W+Xp3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5v312-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:48:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so6145679c88.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293292; x=1794898092; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=;
        b=gQT2FbIOypWDZXo9+HzulRy0LBYdjTpdLI3cW/KBg/nw4jdddU/QlIo4FK3ebqJxqr
         VHCqzLEPP3ERbbFnotcaa8pL8aapk0+q+UVHcfzo53OchcoZjGZi4A9KbGnyEdlMCy2n
         6VuTPmmsNn+Tyw/39/6H1kUfs4CVhI4Zjx6UrvzliMnyRVUE0ad23OTdaa9IhnMn51XD
         AOqM7Cv7i6zQulyJ7gO2bsfHGQ/JvXjtUpHM85IcM50aWzVRZOhxxfbJdPpQfFSXGgqS
         o5Zwx55WHCaxwSwoagVNBsdxzdIx5uPgeeEeiUGTehWp1kH9YLY4E7mWA4MNHn7iHqEI
         HmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293292; x=1794898092;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=;
        b=IVpwmmK9U/luFtPgsmuANoQaPjC/+hQKN47cXijsE/KG0OuiFQe99mXwpwXX/VYWc0
         d2Y9MSO//4+3jtd9hF7Pf5i5UZp77RGgsPwWqlDtVGPiCcMYu8tCtanVg+lPpFV6HPwU
         wzvhSh1uxGISqMGSjvjZgC/9PH0pDvHazEX7Jmodwklh6E2WOcCdnaU/VQQgqKP/TaaM
         HOk3cU/oHw20u9tc4T9C3BXsxSTvXypLf5so3u2n89uSHvQxPnCFqVGNA0inmuc35C8j
         CHTkXRb65O30hALslwF6sbGqr87NPY+3DPdexungjH09anJSOJejIfpoAlq3RM1QQpjJ
         GYcA==
X-Forwarded-Encrypted: i=1; AL+hErHqcEsWFBvn4/oOaDhQZEJOa+5BF0657JjWkAOgZiFrX2kzKFpkvDRU44e3o6nIiQI91ZpeiLI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+WCSjNaxQq5H3svrzsBhXb00P2DvDwuUMgFKuwdQv6Waa0dqt1
	2burlwFyls6Gd0Uivl62puQDh8qeQfUlujKFDBDdyg7YuyBjAnffZdhDPDXJXygX/dbVit4+oKh
	a1Mbwhvp9jZ6zBbHAaAoWVzZacZ1VKv/znLBPmrGYX7JYTa4joqAcBfZJH2rL5puHJc2wf0Lf
X-Gm-Gg: AYBFou0wkoot86Erb/j8c+pKAv8b9knZOPS1TEiVNTNrDm+TGbpi0qU0ttj61/o6DPz
	ZpcYJOPTGxIChojaJUFcYjF9NFXf07ySxoXn8p1auQ788JH7ktYmybAY7OkY08PEgWeSOkLNAom
	1Tj4ohZCd/EqcOAkUliptesyLrDlw8KQl56G5VfowSGr0S6rrNz/Lir7OWPjOkhPMbhdqWB7rio
	Blt6EJ8b2i3CJL828OqC8eQTx58bZjjYL0ojQji4k2+yzXcq/7LFjQ0ZAlOP3nggO5NB+Vyh7Vy
	5dyywKHdBI+ZkyLRrcJvtEPhkppn/26voDqBStwjIw9TrHZrChtlllPAas+vkvavztYiR7cbW51
	QnEgD1mH2pwz8NMImW5whAqQzak0+Cha4d9m8l2/lnkMbp5Fg8T2Uh1tavBTyxq/L3QDu6IpcFD
	3N0FxFG5mLVOxKdg==
X-Received: by 2002:a05:7022:ef0c:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b3b6076f3emr2815116c88.23.1794293291414;
        Mon, 09 Nov 2026 22:48:11 -0800 (PST)
X-Received: by 2002:a05:7022:ef0c:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b3b6076f3emr2815055c88.23.1794293290377;
        Mon, 09 Nov 2026 22:48:10 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm5171425c88.18.2026.11.09.22.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:48:09 -0800 (PST)
Message-ID: <e59850d7-609e-44b8-b1fc-3227e6d0c191@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:18:05 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXwFapUMuGFFA7
 y7ePZIzpIXi3lgbVvFbrye9zmiS7Ae6Y51mSjof0sv5AUmMq/s/dUBuYGvicA6NwXytet5mmO/V
 UZBTEns3R78kVxXMPcU0zzcq/Was+6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX/8x08H/Lok07
 To+NPGMLmUsUnHSN/OGVS5zsyiUZFJVpfkDZ7zql2/N8iegCh30gEDECuxvQfsHmJHlKx4JGQPj
 seTIP1wDYuy5l1JQMXxNyh/NUvISl61AbMh2i7kOI1wm2/20lQSV1HdxrRpE2sKHccCDna6byOK
 ZTkZoaL1EAOSRzKmb7GOZDDhdxUrFQS98NW+3HpaPsVOxUb2rC0GStiRZG3VsTTL83r9TpIIcoR
 kL5rJ16viVcycbWRVFRUXSNR8HayVMfC5Yy5mwzg/lu/9UEAZrAidzRKlforQhHJPP5/1QVziPp
 gZo/bdALCYroYM5OfvKp3YQWFRfDelKVT8l9CiKhPO4ja08MWZj5XVlCUZeVAAPkgOQNJ1lEwCm
 8RiJ90FGWRCJ1y25cbgLveNP7OD7K1S1g1lZk//kPanTUb/7Mbfsw1lLIyrsWgSxP+b7r2XgBX0
 S6wvZKRFt9XGnsUK6+w==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2be2c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p8EHsTY0Bp_m9RVOymgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 4-hOnANZr_lw7njifRqi1ymEWjd2X9aU
X-Proofpoint-GUID: 4-hOnANZr_lw7njifRqi1ymEWjd2X9aU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224812_957934_404BC8D8 
X-CRM114-Status: GOOD (  15.99  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 12:10 PM, Baochen Qiang wrote:
> ath12k currently relies on hardware link id to resolve the link peer. This
> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
> logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
> throughput on WCN7850") tries to fix it using peer_id but actually that fix
> doesn't work always. From user PoV, current code has datapath issues like
> EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.
> 
> Add support for logical link id based link peer resolution to fix it.
> 
> ---
> Changes in v5:
> - rebased on ToT
> - collect tags given.
> - Link to v4: https://lore.kernel.org/r/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com
> 
> ---
> Baochen Qiang (11):
>        wifi: ath12k: fix potential OOB access due to unverified hardware link id
>        wifi: ath12k: skip hw link id match for devices without hw link id support
>        wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
>        wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
>        wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
>        wifi: ath12k: derive device id without drv_link_id for single device group
>        wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
>        wifi: ath12k: allocate logical link id on host when firmware does not report it
>        wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
>        wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
>        wifi: ath12k: use link_id_map to resolve RX link id for all devices
> 
>   drivers/net/wireless/ath/ath12k/core.c             |   1 +
>   drivers/net/wireless/ath/ath12k/core.h             |   3 +-
>   drivers/net/wireless/ath/ath12k/dp.c               |  18 +++
>   drivers/net/wireless/ath/ath12k/dp.h               |   1 +
>   drivers/net/wireless/ath/ath12k/dp_cmn.h           |   3 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c           |  17 +++
>   drivers/net/wireless/ath/ath12k/dp_htt.h           |  15 ++
>   drivers/net/wireless/ath/ath12k/dp_peer.c          | 170 +++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/dp_peer.h          |  26 +++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c            |   8 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h            |  16 +-
>   drivers/net/wireless/ath/ath12k/hal.h              |   6 +-
>   drivers/net/wireless/ath/ath12k/hw.h               |  22 +--
>   drivers/net/wireless/ath/ath12k/mac.c              |  53 ++++++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 112 +++++++-------
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   8 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   8 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 -
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  17 ++-
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   6 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  17 ++-
>   drivers/net/wireless/ath/ath12k/wmi.h              |   1 +
>   23 files changed, 403 insertions(+), 142 deletions(-)
> ---
> base-commit: e3485cc885b81314c814a43db2255b1f9100928f
> change-id: 20260728-ath12k-logical-link-id-aef2481822eb
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

