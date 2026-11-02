Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE2606A327
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3UI7jVQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIu2Cu9w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XnJyFyZf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MiL1WhFr3Ulb8v7dpJjuraCoLDtcPlOsberrX0tY8lY=; b=S3UI7jVQJUjGLb8jiZY/YbTqX2
	YHQ03lWQUFufMDbu7QDOV784Qjrr91Vb7//ijRxlLuMCYZyoJBcI5LXZL3O0/A+OUH/KsEzeQN0X7
	TSvC2/9XxcTftqZPy9IKRS5IJtSkOdleXB0tjz08i8BrfUsSGph+AN0ZFihK8I99+hWSOIgxaW9Yq
	9Fgt7/vzuOX2z9Ha8OPxIGuTUMNVxI1oOyWqjGbXqlHbsmeddG/alEjlayMKmXhD0x6xiNO725ApC
	s063x6FYzpzwk/iOiWVdzyxPoZiECSu/kGjnWjSMsY4CezOEcMS0MPruxjDOT6AfIVDysSSRj3gq4
	iGHsT9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlgy-0000000Fene-00rP;
	Mon, 02 Nov 2026 06:38:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlgw-0000000Femi-0Mdc
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vNuV2745512
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MiL1WhFr3Ulb8v7dpJjura
	CoLDtcPlOsberrX0tY8lY=; b=UIu2Cu9wI4E9ymRcqhqdzXslzn56htlgS+xV6p
	fOSaDgTtqvNB64yGLAGYFg41KKrSombpsbJK5WdlSlNpirpq9hQwkmtn7Fg44x2a
	Qe3P5+0BDEK394z6fiW3abmVH7bqYpLaToZ000lZCiNbNcXzXRuRQZXV/ig8yEnz
	od489dQZ8qnsrwnvAEiiFaPQ3PGIGwhGQGfuFRyyDtmunebiu1c7ExJ5O1EZnx82
	sHkJ3hO+g11kzNLN9ybTMkTkEjtZVYdHeAFs3yzQtz65gJ1h2qSNggok+Q8DICJY
	MuEZ6EWRdf4Pr/FA2RQdxE3JwK/yGUn5c75FpJwD1KQxJ7Cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dudfj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so2637459a91.2
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601528; x=1794206328; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MiL1WhFr3Ulb8v7dpJjuraCoLDtcPlOsberrX0tY8lY=;
        b=XnJyFyZfwsBRr3UB2hvtZlpNBIVSBx6i9WMeES1UDR2AStwAyi5DlE8ekb5Vas7QmV
         yMhI1++uZZbfegbcKl9AIWaxqepP4Qg368ZqXo8kkTiuw1oTf032bgeNcpZqFbEI96fU
         6kjf1qROTKFw6V19ti/gaIwm3u2ZKpuQvMM9XJHFMR3gPKPYbZ4bwi+2z3FupJ3pmmeZ
         0JYa4F4RDoHG+n7+j/0ZzaQES0bW7Cn6QzmeqwD9xjr/gN2bw+7ktUyD0IdP/K9iu7iu
         TKxOwlEswFeJI4vTPhXIodIB9QBY4wbkyn1f0SdA/w2TaRHqwRkMnZN1cLX2TPCRhv5o
         EZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601528; x=1794206328;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MiL1WhFr3Ulb8v7dpJjuraCoLDtcPlOsberrX0tY8lY=;
        b=NPZcLXaeT4ibr85dWGWSu5AdxZ9OZjHS/5NVhcTug64kAW7Xe3zzKtKjMdWRl8q8lE
         +ayLBit3Z8AbY+SWisz3/WBoIbrf5GgxEjM454lfjsmplSA32hkNPycoBDobavXxAIJz
         Or0TQzT+8TpARy21R/bXDxDBxXW+A9gy1VsSEa+DhU1QGGbbCXXZUoUKO753xdw0vH2r
         mpSi1bK6grIjvscTCYldWcpJEdLXQIZaoCBk3n0QPy0buUw/KkzzTQPhmVNc6kR8y9r5
         ztNVuENIOe49nfGEQ7EjayFD8k7BAzo5ZLLrB0DCUDFHKjKl24YibNULzsJ7ZkMWG+mE
         OKAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6eMTkhIF3IL8A6hLrlB8McDjZaxrsMsjheWx+Lzq5OwE1az1sx8tovDF6G/g9otWYz04NjDU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xgrHjAvnwlXaHV1Z5OOuol1dWHfqeXYguMHmiqHsRGWRnMrxC
	l2Cx52+2sxdgqm96oUtKeZCzmV/KL4neTsEpETpMvUi1+j5cKV2F8jymn5T0ha6zOmRDk7z/Wb0
	N+gHIZ5sjpSweA08wA2MRIjYrzoNY55e219wY1KN0EOIp1BOl6IwQ9PON1Ts0HBdL
X-Gm-Gg: AYBFou39zZZiqTp/XCLSQpSVtHQwYfZrHzYwbdWFtCKXetK7ECDn3SiFZJ5xfwp0Qac
	A70UqFUm5TTc55I+Cmj8q12S5qsSCQXqL7y8lJDeknA1VLw6CmUCD+fVjGMZq6/jQ/42iHTHbN4
	2IiB68eqmznCY74xPVbxwG0aJexZ/eFEQTnwD+qp0FhDlacBTGddELhXTH9r2La+k5vD4ZoJwWR
	ra+HapS2kf3EU3400Tt0fkwccHIWpgKG/jkN65v+MosU0qR8jY5VxyuagvySf7u5w1ArbNvbcJ2
	hUrGEuJyIwG2aYFsTn9lCXhM5LDxslmRibFPKampQdwnPRYjso3qOULYibBpuXWcA4zLWwV3ieI
	eOjKb0HY98oCwJghsbzbbeWh/LilNMQ69ZxcpdDXTyRGex5lJa6n7OGYyCFRBKC2QR9/Vc+Z5o7
	wUjs33PDcu7VJzlB4bzIG4dNGq6TLD
X-Received: by 2002:a17:90b:5645:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3ae89776880mr7446927a91.10.1793601527570;
        Sun, 01 Nov 2026 22:38:47 -0800 (PST)
X-Received: by 2002:a17:90b:5645:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3ae89776880mr7446915a91.10.1793601526913;
        Sun, 01 Nov 2026 22:38:46 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:46 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
Date: Mon, 02 Nov 2026 14:38:09 +0800
Message-Id: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIv6GoC/3XNwW7DIAwG4FepOJcKm4zATnuPaQcgToOahi1kU
 acq7z6LQ3tpLpZ+2f/nuyg0Jyri/XAXM62ppDxxaI4HEQc/nUmmjrNAhUa1aKVfBsCLHPM5RT/
 KMU0XPpGeemwsWEQKgsvfM/XpVuFPwR050W0RX7wZUlny/Fc/rlD3FbfQ7OErSCV9CO6tNwSdb
 j9yKaefXz/GfL2eeFR5xafmFOxqyBpFTa4F7SHGHU0/NFDK7WqatWgMqWBtZ4J7oW3b9g/xQwF
 TaQEAAA==
X-Change-ID: 20260728-ath12k-logical-link-id-aef2481822eb
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae82ff8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AaJ870xVPVGd3DHDvMsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eNViyfwaNhHkXCdoUO8YJnx-WNV52qgD
X-Proofpoint-GUID: eNViyfwaNhHkXCdoUO8YJnx-WNV52qgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX1xxd0cjYUi/o
 /o37lRAFyr56+xAqb9EwtPwdNiLK8F/T07wP/FRorDdPwMHyM8SP0ONyzFvsMklIY3zYXyg3POR
 RumhZYrosAzPUta3jnWwvdpBLDDbSqSRXvGYqHq7fltZ8+zSp39JXC9/+AmPZE2jv8sd+MlQ5U9
 0OO0eBJsq4D5lk3jznJSwr51t4s1fP78exYKb4mfTqIR07v7CL4G/aD3ojb7quPQBKG4VppVotp
 a3chCQbVdwL5BWKpg81az7uEI32/oCAi1MSORqZlohUUCs/fkHWN0QtwXnkc4PSiQOXfIPBFZXC
 xaUPuJ9kCemxXwhM73WVIfpRpdYBi5XZS9asLuUZOvJhbRcvUqoAwp4cUp/B8FXnr3+QluJ1slz
 fpz9xjWQFlJLnNQFVm0acSC6HpfUNBHiMqKPtgik+u6WHiCay3+lHCz+RGykMbYwcRqD5UvBmyl
 Y8DO54K5uLRRYhl0Ssg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX9n5lrv32BFwn
 L2n8LjW8/mQkKUCtfzUg+e11TF0YAjSIZ9tjV74Q+997SHksEsXblAjCUivOnRoAn5EubyvtzWq
 UInzyWbdG3SkB1gOSK5Kke01qKllmAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223850_253691_94CD48BE 
X-CRM114-Status: GOOD (  12.63  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k currently relies on hardware link id to resolve the link peer. This
works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
throughput on WCN7850") tries to fix it using peer_id but actually that fix
doesn't work always. From user PoV, current code has datapath issues like
EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.

Add support for logical link id based link peer resolution to fix it.

---
Baochen Qiang (11):
      wifi: ath12k: fix potential OOB access due to unverified hardware link id
      wifi: ath12k: skip hw link id match for devices without hw link id support
      wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
      wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
      wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
      wifi: ath12k: derive device id without drv_link_id for single device group
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
      wifi: ath12k: allocate logical link id on host when firmware does not report it
      wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
      wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
      wifi: ath12k: use link_id_map to resolve RX link id for all devices

 drivers/net/wireless/ath/ath12k/core.c             |   1 +
 drivers/net/wireless/ath/ath12k/core.h             |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  18 +++
 drivers/net/wireless/ath/ath12k/dp.h               |   1 +
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           |  17 +++
 drivers/net/wireless/ath/ath12k/dp_htt.h           |  15 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c          | 169 +++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h          |  26 +++-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   8 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  16 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   6 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  22 +--
 drivers/net/wireless/ath/ath12k/mac.c              |  53 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 112 +++++++-------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  17 ++-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   6 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  15 +-
 drivers/net/wireless/ath/ath12k/wmi.h              |   1 +
 23 files changed, 400 insertions(+), 142 deletions(-)
---
base-commit: 090ef659b1f31fe852e956b0ebf274cc7d967cb7
change-id: 20260728-ath12k-logical-link-id-aef2481822eb

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


