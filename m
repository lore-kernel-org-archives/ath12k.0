Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D996C9830E
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=; b=TxMouSKq9UJTzO/YSZkO75/I+W
	EEr1grza2m3JltLbXQA93B1yGTlxxtEAxESlog0nwRvAW7lW801EipzVKvLETm3djyLDgeETzELwY
	5TtZkpS5IL/sMHTs+6Tv/4TFr/l3BAWEpLt2Zi4ksEMHEcSHl4Y9iczqUPc+24iXgZLEFM2jhKKgF
	ha38QXItx554KiJxx/V1QKyGpjYjR54RsWu2J4iezWcavdAwdZmiesDJE3FOpBFEwEE+KpwVOCOu4
	jI5UPSSg3QMLNrPK1klW+Hd1JLiqBE6nWMyNmuOraesoe71sJbAzPocOfK3mxz/bpcR4XjpTdQy8F
	INjVwdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9npA-0000000BrwW-35y9;
	Thu, 24 Sep 2026 18:05:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9np8-0000000Brvr-3gI0
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 18:05:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeU1w2469621
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 18:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=; b=p8vUAKyx/Dr2AED4
	M49MPPH4p/uKaFqoxY0WjxjMfkAY/1JnIpU9u2rBroiDigGYhrc7ccOIxtygX/p8
	DMz9mO/bwIFCMqlTOpOcW0BAY7iklMWR/eifAE/3YtHEcgAtbrbaAK9tdGyS+CC9
	WQTD/8QbiKs2zftQRPGrnfWrEONhxWT018roCs4lMjjZ7fYz3TokF4Mr2Ry6Yuxf
	oqk57zgd6hDUi/zmRL5kqU0dcZhhHevR7BdUebbsFRRexbmiJOUQJtPCD/FHkkF9
	e2Ay7DseEnTsG5TcJqliJmgQfkXzWMHq5Heo/aJwyANrc2UBIKHIVNM8vBw/YzWU
	ib9WsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8ry64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 18:05:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34111ac07c3so135541eec.0
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790273133; x=1790877933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=;
        b=SlQEpFxXL7A4s04OOt4fSdvoWNA1SB7AOwhLmAj9MRvT6Y1wvCuh4uCNOoc0YMDGz2
         gArwXjUsz/X4VlSQYwsT7AZyQ2qLcs/YmIO6ZBLzssxETXQDfnPFVMSaSQhVfgHOykgd
         FKyHUFAa/1vchGAD/yv6Nn74TrQAQOdplI8KOB//YDX+uOPXZ7fqikF16QOp6eDYREDI
         JBEfqqpFEgMCAdTfvnwnbu+Yl1uB3vDb4bvH8mtGsJCtd58qW+AgVSLSalINVe9OSICU
         Gce421dJFu/MWu+wLF2lGbVh+Y4IKyaWaOzHYKBqJjloNh5GB/6ZPnCbp8t5Ty0O0XeC
         j6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273133; x=1790877933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NciJi724PYOuJaZjl0Hvr2zs/KfmXmBRkdX/KNNBCqE=;
        b=wlblc0QEQlxzQUtYz/GDei3tFYJAzbBvFH0vT7aKBTkt+Y3N0DIEx6g/RwXHo/E+zU
         0clIe07Xop8NgGEMujPG4vPY1SVx7HSLfkyZEY9+ydLX1hzJO57xd6TK8mmbxjPighlY
         AbpD4hk4aTPEx99k/AguBiY8Cg9jaOoJm1pZMR/zagKcm7MGCOJZGX1TZT8vvtGHX9hV
         EIG8Q+nQ8aX7Y13y+XUOXFDcTZF+9kmrb++As2oxM+G7GBPBq7OuPe89hoFg/8eiQWKR
         Be3AcQ7ogHZJbj3M0ZoKFQyZPCZrZDS2zdv62EYHfqfyT2i4bYALHU+I+bINSlcBjEGm
         WDAA==
X-Gm-Message-State: AFuF++nSJHissY2//oblIyk1DyvxF4Y2uW4DfkeOzEUP1rajv5/1IWxG
	oVQXMoMRD3caNoWkY8YOPD7TjhLqZNiDP/kfetIWS8hdAjhvf0dj+Yg3FpUr9f9AOjvguFFjn0g
	UorbylQkHOpUgJmuFNE0B0EAf2RhPc6DHLHQOeKFYws5sGhi38SAZl3CDaK567EZ5
X-Gm-Gg: AYBFou0hLjdUgDlE/FRH58+8GG8Y0xzQAWjNRAi11k68Jm4O5k7lu0467CHhLfvXxhp
	mwhMrig8sWUR0Be7QNYzzrcDF0tBFoSm2FcLaObvriVoTo28GIq3upGb5zQPejVTl5vc6oDhbyT
	fIcMIXU0F5AFB4aaoIipYmqYLCBzgJNEA9nlBkpWcWG0C4MkJnDTXkqsA2E4zy8DKCdr8xWd3B9
	5FuFGK8U68rclU5pZ2axStSrLk9drWvhI80OZH668A8O/Izg5kcZfWmS6PN2qyh2wA2FkO0roqV
	SL3RYkEQo7ABr48KghviFijJWUXAEUWpR+43AEdzfpQIlCYvJZU8EI5+JL0djwLmUoObL19yUeO
	14bebrDTuoIsefT0ns1KjD49VQS9JZSv9Y30dGZHPizDROiWO6DhTkNWgxA==
X-Received: by 2002:a05:7301:f02:b0:33e:5f5a:4b55 with SMTP id 5a478bee46e88-34005f64032mr2401546eec.19.1790273132217;
        Thu, 24 Sep 2026 11:05:32 -0700 (PDT)
X-Received: by 2002:a05:7301:f02:b0:33e:5f5a:4b55 with SMTP id 5a478bee46e88-34005f64032mr2401510eec.19.1790273131229;
        Thu, 24 Sep 2026 11:05:31 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm277409eec.15.2026.09.24.11.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 11:05:30 -0700 (PDT)
Message-ID: <c6611810-07fa-41c6-af3d-486891444dff@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:05:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on
 QCC2072
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3NCBTYWx0ZWRfX5yyxYSvSV57H
 bjQBv9drh1NA5vwTGj1raRmyER121coVMM4XZAkOENkIAYgev0S/BcuSaHTg7mOv9dADQG5wyFv
 omzYWmNEh5jNOt3wuV1k0saJ4dWovIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3NCBTYWx0ZWRfX6QM62x3FCm+6
 JuzULpqnT6hu0YVumEiQJI912c14l4wG0o5Pc8YJxxG1eIe/kuUvYD7onT0QaDOfU3GhFwcDelV
 6nX1sTj8s4U3/hGBReRdi7ac/sr9Qt0+YrLn/FkXiW41vP+RIGzIDkwShVYlQNvoIrbF1l+enQJ
 CDK/5UkrsTi3Kx7NNN0qQHzsObjkXgkVcwcY0l4ZgTip3GoCKtKY5EU8TZFhVNwi9mk4Bmw0dpP
 cwZ5C+79fIPMwlcWHwk7vuKwyzcAatfPNS8jlMVc4WKb6RZpjPojq7IlEJV63buAod+QGgVvJ63
 Q9Nu7kX71XP0MFk/dRENBRfYyGhspT89UKQ6hYgUnmcVxOwpUcuF60N1rcdwbwvMDsXQSfQHved
 QMKQwL5BbqnP0VndyUR6xW4QGtsHy+d//y9u6ZnzyBg85aNpuzzbZZrEFB86HW/bF04QJMHD/hD
 O46dy9gnNyTE3xJgu3Q==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5666d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6nRZ0pPnUwzynh11DroA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dFNWI7mofDu0qmHisfbaHzTcFlYZHy4P
X-Proofpoint-ORIG-GUID: dFNWI7mofDu0qmHisfbaHzTcFlYZHy4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110535_043017_153B9D14 
X-CRM114-Status: GOOD (  17.33  )
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

On 8/14/2026 6:43 PM, Miaoqing Pan wrote:
> In MLO connections, ath12k_wifi7_dp_rx_set_link_id_wcn7850() attempts
> to resolve the IEEE 802.11 link ID for received frames by matching
> rxcb->peer_id against the link_peer->peer_id entries in
> dp_peer->link_peers[].
> 
> This fails for EAPOL frames because the firmware delivers them via
> the MLD peer path. In this case, rxcb->peer_id contains an MLD peer
> ID while link_peer->peer_id contains a link peer ID. The mismatch
> prevents status->link_valid from being set.
> 
> When mac80211 receives a data frame with link_valid=0 for an MLO
> station, it calls link_sta_info_get_bss() with hdr->addr2 to resolve
> the link ID. If hdr->addr2 contains the AP MLD address rather than a
> link address, the lookup fails because link_sta_info_get_bss()
> indexes by link address, and the frame is dropped in
> __ieee80211_rx_handle_packet(). This is observed on QCC2072 where
> EAPOL M3 uses the MLD address,
> 
>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
> 
> Fix this by resolving the link peer using the current operating
> frequency associated with each link peer.
> 
> For 6 GHz links, the received frequency corresponds to the operating
> center frequency, while for other bands it corresponds to the primary
> channel frequency. Match the received frame against associated links
> using the appropriate frequency for each band.
> 
> The frequency-based lookup is used only when exactly one associated
> link matches the received frequency. If multiple links share the same
> frequency, the match becomes ambiguous and no link ID is assigned. In
> that case, leave status->link_valid unset and let mac80211 fall back
> to its own link resolution logic.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on WCN7850")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---

FYI this no longer applies to ath/main, can you please rebase?

Applying: wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c



