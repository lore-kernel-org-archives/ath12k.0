Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86139FF8864
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol9xWLn6aYKX8+YID9JOnFOXJDXILYdNP80VNwE71jc=; b=x0woL6/fTyc7cJs1BLgbvNKeQo
	WVYfTLozPaq6GuFpVK5BmtE12fDUxFUJ3khy5xit/AgUh15mZItm/34/uCMx8NDk+aYzgI7cqWK8t
	QGSCA50adlJ0OqFAmUllfLVBNWAUZHws07+g7d7G2WBrfXa/dUb85PPLhbMiE/6+ABDzlyIlPMucZ
	AVBgTCfCYufXuwH5zK5T9FKll+0pxtP0VN1h/XpW/xzrwpNDN4wm5m8HUlnWHVGouZ3lV6j2LyDa1
	NJ42UUP8LqrEQYHxaME4wSGzEMzgjW1u40Tzyx8EnjPKkZMyPYrMom3D4BgYGPK+9BG0/RvynEKiT
	6NLg2naA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY0S-00000000QyS-16eu;
	Tue, 28 Apr 2026 02:17:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY0P-00000000Qxl-322J
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 02:16:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNeM9662935
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ol9xWLn6aYKX8+YID9JOnFOXJDXILYdNP80VNwE71jc=; b=AaUC161usZ7/3QeC
	EnaD1f5yxuozRy5yT84PC5i1dMSZiTELM4LHjKLdeN7JIql1nY5fHZaBTIftTmQO
	oAO9g5Zz/cv9yODV9dvQIuAXKoNNrYWJ1PhLOYbjcvOYu9RIOiph+nK2rTnodCIc
	0RR1P8jd5CCvAWcVrUogFuQU6mqvxi0JKI2i3yiIb16QY4jTFpUu21lTy7I4TI48
	HXfunUOB5W1YE6nrRiAgFUzi3XwkC+ZrzJwck0WddszIWZiUWEgKDfwpE8Z1Pb35
	+2rLz5QFflViMHApILzcersyUbNdBrete7kD9gGM+HfpoxtoJ2jn0cgoZMjPS0tS
	iFyFrA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n1qds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:16:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so20017347a91.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 19:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777342616; x=1777947416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol9xWLn6aYKX8+YID9JOnFOXJDXILYdNP80VNwE71jc=;
        b=HEQ5gnwSbUmypx5TtwFGiPO8FZxR+IFKvbJ3sCICp1NQXtnsp/1xfzXmPJ6KRB5ucv
         9dzv4BSqsICNLiTgvyOIyk3eEkC2yH891KyHwo0DnsbYVN2rAtCXdr5oJuODCeHgk9f9
         fQbrEaMIU4QK5OukegNEMwtpcd4/F7ilND3ock7c5mUUPtMi/RdsqVjCHHWniMPFZzWi
         w+i0SwXGEFLkbIs67pHlzvDGKQCLb1j51RRSOFmh+yEdWuo+ly1COnuHKxVJ3BzVF0i0
         EtyFLSOj6tcUHtEvkSo1Zm6rpVrnyhNaxT/eLgGATvNxrwGupW2hKCgbDWhyFzOQ9vqO
         9SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777342616; x=1777947416;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol9xWLn6aYKX8+YID9JOnFOXJDXILYdNP80VNwE71jc=;
        b=A7FvkRnFlJJ2AAGaPOixJDL/wd+1fNuhSAcGu701BGe12MCShPVK5iPFgrwjREO7jr
         O8Pc+8uwZ2W65SofK7ZmR99gZf04O1KpoZySRtQPxTbAsrje4aJYChmS9e1D+e2XALUG
         cLYj41II/nSWqAyfZY72nMvSsQR8lQ5oMJmcVyi/k5i/GL2pz4RYXn5Vc00RrT0mgJ8J
         J1g9k/00y8Ah3XctbAIYwz0mUEQBSPqasLWnMKWjN0xTpIvD8XGaVwv2+FR0q0OnPfwp
         P9DZnbKuC4i5XMfg3Uj/cCYLNc/+aLcmtwEhWCStP0eSF5mYgc1gU9FNBgvLnPsBSICr
         P7fw==
X-Forwarded-Encrypted: i=1; AFNElJ80JP9FORwRPkm6JVrPlh6IDcKktWgS+qBVxJklpliO5cn/6HA5H8OI4UY1eOa7EsAKlDj1jXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tBfTltm2f/Hig4EMtuTWriIN+aRc6Qz0K2SztpFNOzeIVoHW
	8zdhMnob2lIp7yBfvYGWhTuNZ1MPwLvNWMcQHWnyUf01BvNTwmw3iz+e+yF4zjgynKCSwVgT7Ns
	1BoH00980a0zwik4AGTMmujcvyRXGnhuunVCR0ZtYA/AAn1dbvIt7GOgMh0YZT4wR
X-Gm-Gg: AeBDiesHqcLlHXOj2YzbvSlTzl3orw/nmHg6h1TJBGxXomOPmG4qlVY0HGvTFxQih5d
	kCEC6iOOp5Fbd7NfmPKYvIPRvjqnsrvEDK8obLrlkoBAbfaOlkDXyhHVS6ccHF5QVRCaqAVrvIo
	pY23BGGO0+sw/BSp+K39C7ZXrne3DyFnaocbVTuSqBANg8mroBsYDWEdDDiO0VNutVtsgV99zJJ
	sdBlANWzPdzXQPdVVEV6NGFqKYml/Hn/skFWzl1zAUmeFk5uxm2iQ1Hex6MPS/AkU+VdedmjwRj
	iigp+1rIOIetVNJFHcaQruJJxTxPDz2L2knayeDq5QXoU4RiHvdjrA7+s5V+UOCBGKyoayH83O5
	kgGNPqh7gtd7JAKecl1yjbdjtISBQ4yYjVFJnfn1tf4nXi3tw1k8Y0bAydAvJ3Yr+gdgoYmJhfn
	ID7mBO3wSVTHeWJ7zZvreyjziQEX+gSw==
X-Received: by 2002:a17:90a:fc4d:b0:35e:57cf:c0a3 with SMTP id 98e67ed59e1d1-36492077fe8mr1131002a91.26.1777342615735;
        Mon, 27 Apr 2026 19:16:55 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4d:b0:35e:57cf:c0a3 with SMTP id 98e67ed59e1d1-36492077fe8mr1130972a91.26.1777342615242;
        Mon, 27 Apr 2026 19:16:55 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490fbf832sm897549a91.15.2026.04.27.19.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:16:54 -0700 (PDT)
Message-ID: <4a59fc51-2b57-494d-bcda-1060de1e863b@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type
 in Rx path
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMCBTYWx0ZWRfX0+deaKbD5lZm
 NsOYZkRGPnqvP5MZNcau1mzYpxxqhJ662Jt2NHC9Rt3nXwmP/3Bn3bfIlCd+G80HcfxA4cEM+iN
 YNYExKV8hV2sEjBxNKz+vnH1ljTJm7NZ/X9Crcn+rctovgRUMXEsbGsqzKYQdLYpbOYknMGXS7F
 4AvgKhvD7Ns1qX8UqmBJzV1omBhNCE6Oy5g6jTTAtlho9bnhM/5I/t2B0dilEd++svO/ZchJmm6
 EECU++24D9SmqsztW0pt6Z+nBSkeSPKLjO9+SjFyCQd4dsBUsNKoVMVpgZ11sIc+SLwXn0FAaun
 Sb/9aZk9nLpM3MbA2LvYnvoKJfvU26MI+3vET+2WpbbIiiK+VI5snxeVuf2crZMnmfDV0nMxB2V
 n6yDWjUVSH0dekxtPMuUe6pI8UmDB9pILk+cKdJKfSVRx59xKgC9d9yxkVbIj9QOm48RbbqyREB
 WJ5F8X5u9oSkMkGnmAQ==
X-Proofpoint-GUID: 5Zk79Fy41IBHJaO1Gt1Bo8Rvb6TUVyiy
X-Proofpoint-ORIG-GUID: 5Zk79Fy41IBHJaO1Gt1Bo8Rvb6TUVyiy
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f01898 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=M6RSCC_QK_m3dAS1aMgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_191657_882715_89157011 
X-CRM114-Status: GOOD (  10.44  )
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



On 4/19/2026 12:36 AM, Tamizh Chelvam Raja wrote:
> The driver does not currently set any rx_flag for frames received with
> decap type DP_RX_DECAP_TYPE_8023. When the hardware reports
> LLC-encapsulated packets whose length field is below 0x0600, the MSDU_END
> descriptor may indicate decap type DP_RX_DECAP_TYPE_8023.
> 
> These frames are effectively equivalent to Ethernet-II (DIX) packets,
> similar to those decoded as DP_RX_DECAP_TYPE_ETHERNET2_DIX. If the
> driver does not set RX_FLAG_8023 for these frames, mac80211 will
> misinterpret them as 802.11 frames. This causes valid frames such as
> Bridge Protocol Data Units (BPDUs) to be dropped. BPDUs are exchanged
> between switches to maintain and manage network topology, and must
> be treated as Ethernet frames.
> 
> Set RX_FLAG_8023 for decap type DP_RX_DECAP_TYPE_8023 in
> ath12k_dp_rx_h_undecap() to ensure mac80211 handles these frames
> correctly. Also add multicast packet handling support for the
> DP_RX_DECAP_TYPE_8023 decap type.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


