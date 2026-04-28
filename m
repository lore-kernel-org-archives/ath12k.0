Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2542FF886F
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 05:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/xnh5WaUWNjwzXKnAXaG6bkmH/ZQh0FiEHJYtnrwfs=; b=mtrs8V9FOtO45BLOKE9fvEhj+D
	UdQ+jPhVgcSMswdccqICYcfZIo2Nw93OSZ2sRiQyRmHwgOEqy8qqQa+9ozQnAJ/Z9EUqBriZ4Pvj6
	aq+H+hGDZgfWtRJbqTMx6/p939auyScoPOiFkjq9Oy5OshPofPbUgXuNtB9trYgnlMsbXN/yZWnUV
	yCgOc0q+iafKh8W+/lUv2fpQZg08GLVy3ZBvOhbgt7XS5tLqA6BhuOqy0cV6kSk/2h8XwjuQ/s0e4
	nX/QL197KqM2OKqGgZhwBnfTWccq+ya0JN2Ig7mw7n7mF7GwfWKPr58FeXzMjdsDg2GxjoQi7ld6Z
	l85K6vXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHabM-00000000YgP-27Qt;
	Tue, 28 Apr 2026 05:03:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHabJ-00000000Yg3-2XuD
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 05:03:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RLnYa4241566
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 05:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P/xnh5WaUWNjwzXKnAXaG6bkmH/ZQh0FiEHJYtnrwfs=; b=CyQhcFpNMQVUhMt8
	zR/ZmIUcGUGQJ847hCV6OZgN2xft52lYQ7QCde/55EUY0KPQlP0lZesiVLEXgzqZ
	uUJrsxj04chymbHvmb7ndUfeE37LedneC6TOhhMVitw6w8XnT60ou1NRusXniSen
	6pS/Ro5w9MyjCUthMWGt5QEWB1QM3fp96rDgMb1HeF7rjQ8+7wsMEr/a9uwXI1u6
	aJnD+djuTL+2Bq+kkIGnKKR8KyzPZaVHkQ56IXpIzFmqpMcPktdxtN0zf4U5CEFE
	26ESOBYRNy1FFUNjo/3opowtf0F73qlpOUtvnzdIXd/cwAAc1mCkUXrLAhsTn6uT
	bV/VFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946u1du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 05:03:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso13225884a91.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 22:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777352591; x=1777957391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/xnh5WaUWNjwzXKnAXaG6bkmH/ZQh0FiEHJYtnrwfs=;
        b=Cq3I2lTzxH/l8y+n5p9eLpQYnDoqApKY7QCaeUVRrzw6Gfcyr17+8g27GZr4InNgx0
         7Z8gKBZyOi8CCcU0jYjmzZHFOJ+Xo2YKKmMMNRCWWzCOcyUk92dTFtBfXOwp+tHARwEH
         J4/56LdgjfKgisS/FDRtAvadvSjk/OYdW0AfCT6AspsKeOHHYIZJjj5PyZ0cFBoj6aPo
         +4Zz1aKR3sLhDSwB7521FSIzuaRePH/2d3jxINpOmfEGTavtk6cB3i+sOF6/ijQlFn3/
         k+SjsoEIDEb86mCffSDl6sHGTYGVxj2HMCxvddvapOTQrwKmuA9wKGeLKrBwvx6yZkCA
         9vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352591; x=1777957391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/xnh5WaUWNjwzXKnAXaG6bkmH/ZQh0FiEHJYtnrwfs=;
        b=NV9hm57HUgP0Nyl04G4JRfv5EaqiPCDoCLDTUnzbBTfbd/ZKXkJxa5Su0IMGtpJcD7
         8njMoU2kgIDTzG8K7cbxNS7Qp1/SaeRIipMkAxJUddv5JFGAluPGnUZwWUsYjQX6RixJ
         l7blALjao4DBQ8JJnCsSu3beqH4d+RtwPj0K4H6xFK9U4bAQzOdF0GqtsOEdVCDkr0Gy
         W1N00LTXpS3AkydMemZi8fFZIY6zqg4Uqbbbm+3bKcqHTZZixbv98WwI+HQZPu9nvIvZ
         khxh+ix7sPEDzOXgBCrG+q2eJ1jKpH/K5DL6ytptTWfh8uMQ8AVxYBqVGVk9p9n6r8Fx
         bGdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EW/Nx2wcrP4i1J/qdwrPnr6ld1CcbShsWEKgvZzPtc2oS6qInWcBuDZIqasww+vavmHkhdlw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ylF/47Sj9NuJTROwV0Q2v22TkFsdwf7pMs3IywPuJLVuqI3r
	HBzmQd9ABG0i+GRIR1LgUz+oCx+3eVafSit+ywK27kV8FBwmnhW3wB3ktp3YQXXyOlgTB+AGwFC
	EBZe2tGOzzcggxzOljqKmViYVo7Xnp7En7zpenaEg/31IL2u5AVrzj43M2FM6P49q
X-Gm-Gg: AeBDiesWDpG4v8pdz6BD8cLkR6Iue7ZHHkg6TYWHzWcxDFv9uFtS03/ZTh2lMQH3tBi
	fWjfrjgXZKDowlX2kzR74Koz6rpnuqyavdW/6658U8fCjwjj0rHecqq1bRBTPDDsdZ4IpSSYhqh
	VWjvZ92a6zkyZ44urLGSx4/qRZAYCfSg3FtSw8o81YwsuM8N2j7d46tHsNoTizYnz8PQ/jQelhD
	4QYu36aYLMxW95O/7KHpx+Rx/R0INl3FZuhQKOX0iG9ZBolIMhCjO4cFc+6EMTp+LSfZZ2nVWvc
	5Vk9f01scfQQWdYiM/3GCKv+a9mexhv3HHqiLfAat+WZNgHA+n+d+rNlBF9pHno0iUBTnJu5Y++
	s93LHSySP0TXqpQZijEmcQnUXkhO1UsVcyA99vp72i/wmDpzBXceNIWdtAFklOCoDdU3rLP62
X-Received: by 2002:a17:902:6b8a:b0:2b9:6a4a:137 with SMTP id d9443c01a7336-2b97c012656mr9054395ad.15.1777352590847;
        Mon, 27 Apr 2026 22:03:10 -0700 (PDT)
X-Received: by 2002:a17:902:6b8a:b0:2b9:6a4a:137 with SMTP id d9443c01a7336-2b97c012656mr9054215ad.15.1777352590333;
        Mon, 27 Apr 2026 22:03:10 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca92d5sm11691725ad.79.2026.04.27.22.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 22:03:09 -0700 (PDT)
Message-ID: <79cafc68-fedf-45da-8235-0ca0a30b1e0d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:33:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type
 in Rx path
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f03f8f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M6RSCC_QK_m3dAS1aMgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RC-z6aAszDwKHC1sQ3C6pFR9NmDI8j9N
X-Proofpoint-ORIG-GUID: RC-z6aAszDwKHC1sQ3C6pFR9NmDI8j9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA0MiBTYWx0ZWRfX9yyLtsCK+kDp
 UOi8mGc4EVu1S1qvhKuDzxHbEvkU4VnXKt2hdzHJ0DSF4g9JQq/MyUFTiZT4qvVupw2DL5eqBBB
 f15Y7YNTS0FbZ3LMaQSaWG+qJSSU4zJFWTdtSNHld+rgX1O25qP01shEGIeeR28maQjqZeeC4p+
 9EBZ9xIL4nuqDQzs3Um2OsHzLN0HoZ4NXjoZj0idNpXwEE0fPcqd550KMdzuEsiZw1fSn9sxMDW
 CNkZx+TxjZvGyss8CnqEzwsvLqMMIwHVle/uWoGUdB6o+ee4FRrl67e6UxEzUq/MhZG0sd2+nRf
 OT3b0uZGD3NkjPt7jyTPoibvE2dVvYLjvCMBOWANGBJW0ltHmK/m2XGlCoyft9GCktViiPKkMgd
 efgzdLEJm8y/TxqC6ICSLhqGMLXfO6spvXi0PY/5bHwyke8+eNrgIyDgJZfYlv6+WxBMPSVxa87
 figRFYagNwH7evtA7tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_220313_788047_29D1EB30 
X-CRM114-Status: GOOD (  11.35  )
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

On 4/18/2026 10:06 PM, Tamizh Chelvam Raja wrote:
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
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

