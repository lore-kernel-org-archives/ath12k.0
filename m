Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F39CD6E61
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wid3DDI/vP0etr8B2+buGHcNLhhC3wHKKzQslZHjTFo=; b=jVIx0UBk/4V8TQhvhxs46a/9Lo
	CaVs/iadhqXDV/c3grs7BGZDiBgbS79FowUKXbaIt4EIxtpmcKs6WGitWnwBbcZGQ56mDB19UTkeQ
	4ATebiofdZsEtqA4bJjZnefZDLbVx+QVWmJQsQ6xr16BWZRwuSfD9XzD/qKjN4qS/qCXeC7/b8YaD
	9lIq9T29FjigxWnY+vL7DHRqYCrdC8QvFsWfLaUXcC1nFgnrMXYsVamTeuJJqbd/ixoS9D413RqWt
	S7vvRce4A3q8s+HX/btRB4p6KcyAGygbw7vkYbw3sjY3uQq0KtLR+iS8OLXRKDM52nLzm8a/AeBZ/
	Sv06plIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60G-0000000BX0F-0WJh;
	Mon, 01 Jun 2026 17:00:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60D-0000000BWxY-290S
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F4KdY4111164
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wid3DDI/vP0etr8B2+buGHcNLhhC3wHKKzQslZHjTFo=; b=o+6ZehuDaFW9evHM
	CK4wKqcn+Ap1KAkN55pRuhWFVP08kTBnbzPWhrKiAsuimN2NW3Wf+uWiKwzxFVOi
	cvynNpQf25tD2m0rBfPSaD7SEN3n9NHUHP4F0zcwI/+cYA3KJmPNXuwmQ4BAZRmQ
	9xygBAc4eaozoNxDni6tltE6bxTbQxEHK/U1axPgSrAL/hpa//zWBbtX69VNYh83
	vTNAk4TKWyuV9ol3oQ5C+nAvMQmq7r8tf3GessDy3r4xa48bzXcW+ctlZGzbnBAN
	+tqQm0hCMaySKwsEP1ATfrKVUhdthjGmo2nlWxYJHYXODHEZIgGl1nsv6DFBgz8v
	PlAs5w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3t22y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13709ab38a8so10458376c88.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333236; x=1780938036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wid3DDI/vP0etr8B2+buGHcNLhhC3wHKKzQslZHjTFo=;
        b=jhs7nTCEw+UVy02v2AQndF/uvHOLZOsu10ni10FeTTdVv8vrmSEP5wGlMbS2Hqzf0G
         25vDrPf92nvSG//FsTulo36Hn+oAA1CkFRyFSarms68M8+O1sxkQ2hF6RV9LamqBe8LO
         FPA8RXmhd1E9utAEQBwrloMWNwaUIiT3kvCcnNlSWcUWU2lCNa4F4z16cZelodfdBhkh
         /Z9ee1CWEbeH2ehKKXfdDdzi3nQT08t/zRVaSUO1VqHoE4WuZQFUzyJfHHbFfJLLcThN
         6iiuhR3SIAOkKTAen0KASKBT1PpipjRIa48ASfzxphbFIZ7Ee2j50bqnEllu/HT9c/xF
         qffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333236; x=1780938036;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wid3DDI/vP0etr8B2+buGHcNLhhC3wHKKzQslZHjTFo=;
        b=SnB9Mb0dUw4aShnzjLknksbWwmWNFIUbcZ2J25zXm1BbzwEfkYKhyWTcg/+K39Jznr
         TXinN1WivK/BU+B6nqlJB101qBSxIV7uS7Jol7KVYNcL6D1kObj0f1g8u6XRAQ6ZyuQI
         UFqLPwJD+TAoy+9iHCuHM6OqPGWmfX8gl6CjG38GWWkJiHXyweuPyT4CiOGXBoxn0NFt
         R5ztGiPTGifr3XV+FYGY15ACx1P+NHAUVDv4EpceMPr3Wd3wl4AdXd4G6h161ddvvdqw
         KsOmkhSR2HM37bcnc5QtKBeK/6qJdSMAxgZShFdNHypHWMrfq0IrE8fwvmv/jJOP2HiM
         pB5w==
X-Gm-Message-State: AOJu0Ywy0wShuMOAT8Hjemx07C7mmt+V0bmpO7qp1wYUwokJsaUMcSDK
	hshb02EVwdZntNzBJ9Uw/wEeHl5cwOQGCoqzw8anuaby8xapWskk3fChWw0yRJJdiRiplIO572d
	mkpbiWA8sit2BmiBes7xwcGfZyztNtstOA1tH0ondJAZoW8i9OHI76OG9DqWTmr2c
X-Gm-Gg: Acq92OEMQ8fB6mdZ537YwR0kFgYK43L5OkSqKHm8EPlkvfupFcfpCD908lqy9XXMvbW
	tnI1nWJ81gJGCldNY0JL/xljOtF23GcDb543jSgWZCrLTwqtk03Ua2egJ247Xca/VdOrMgD8CK4
	/IQTAtPDsFEPA0GWvCxTJi5uZevyC2N9ZxEsPh44jYhJJAOZOrhkpFdB5jbD9Oi+Ry03SF+gg6T
	V4SlGJXnSsoL9Gj8i/hCEemqFk/hd037dVy1J9IWVrpG+z3qSf7VsKAI8K17PCivw9JZbxWm5qe
	/ER3NQgJyuIgncMQxCfNrQTjCtldgqhUtAVHfLsXDQXOZGa0uMiH1f50WPHxh63cRQJ9VDVUEdy
	coWStJgjCNoz7KmHod7JfL+SebFK992glGaidlnJ4u5bVN35XQ7yJGbpNT2X/pIR8trSIMfQ5eV
	ykG43ISyLqlHs=
X-Received: by 2002:a05:7022:503:b0:134:ff2e:a71c with SMTP id a92af1059eb24-137d4025e9fmr4324817c88.9.1780333236352;
        Mon, 01 Jun 2026 10:00:36 -0700 (PDT)
X-Received: by 2002:a05:7022:503:b0:134:ff2e:a71c with SMTP id a92af1059eb24-137d4025e9fmr4324759c88.9.1780333235263;
        Mon, 01 Jun 2026 10:00:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
References: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: allow peer_id 0 in dp peer lookup
Message-Id: <178033323396.2045173.3415410240571693213.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1dbab5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vhXu3zbcF_WYshkwkEoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfX8rcmPJJZSNkR
 ggZuYqpspB7osurBrFuJvVFaiVsZzAyxwYrqWkoTgQZwB2VATk5HAfLADiO1SwIWcsvUfI1CUX2
 IiBrX7MhRTzHIhud7vx8NQLAw9DAgapLKZYzk5G45Ufa5ZqUE3MQN9oW8BWYjRebhqALeeKNX17
 gVOvOZVPALPU4hxwmBWIHiFfapREPp7NtpVXiVXNFQdwHpOBkXrQHqgxDNwlYJ+ph23RHBzv4KY
 F55z24H5n3vQpQfTbjdOSkqXcvdGB9LvYkREm5183AC1lEQteNdfpAfdKgZnSz8wZqHPrM8hZ/e
 vS65xv4ZLFUFlFblMMTvNfg0qMwQObmuQId7aC5G9S7pHMxIf2PtJEtE2OSsz4CHr6QhkIQ6KJy
 8ttcrbhdyzOHGMmuddL3XiLQmUGzYcAeRn7qIN0r3R00fnGMtmEuOQ9oGe0Ri6dcU1/HBN8Sd0f
 5anweNtK1H7NqGHcFXg==
X-Proofpoint-GUID: nFcIJNGIleiw8HeORjVtPtMJtYt0gK9_
X-Proofpoint-ORIG-GUID: nFcIJNGIleiw8HeORjVtPtMJtYt0gK9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100037_591117_388F050E 
X-CRM114-Status: GOOD (  10.13  )
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


On Tue, 12 May 2026 10:57:32 +0800, Hangtian Zhu wrote:
> For some chipsets, firmware can report HTT_T2H_MSG_TYPE_PEER_MAP2 with
> peer_id 0 as a valid value for mapping ath12k_dp_link_peer to
> ath12k_dp_peer.
> 
> ath12k_dp_peer_find_by_peerid() currently treats peer_id 0 as invalid.
> When firmware assigns peer_id 0, peer lookup fails. As a result,
> DHCP OFFER packets are dropped in __ieee80211_rx_handle_packet()
> because pubsta is NULL.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: allow peer_id 0 in dp peer lookup
      commit: 51d510589f5cb54b9251f4ecf4c13f219dead928

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


