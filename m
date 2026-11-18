Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15673606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wNBshDcD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=StJ/nTMi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUJav6d7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=; b=wNBshDcDg972q+bnQW5eMbSrgs
	qEWFFN0bOaYvWDJl0RcBcDYdJ+gQ1Ex3keV2IzJ2VxDhOpzItBto3RHSyJzhbXDGWe3EAfYSSzMM7
	jk4Fr98fPSGZkUEvlqxk58Kq35qHMZkt/fnZU25HiEjfQhRYgJ0nNE3DFZ7DyPUADXGlFBPSeTbuC
	mM1W9Xzu3XuMx3rMhTrXVlgCbCShJ5m9P3N1IXnwIXhdqhiwF8x1Jf3TvIZcJGYLFNLIhwEcZzm6F
	ln8UJULukBf9O2QI1X6nr3uZakkLfqdEuTH3Yb8mZqGfkMxOb805cjYJ2kSCi1CbeR2IXNkEUdUq6
	r+IoMXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ3g-00000007t0V-3AZV;
	Wed, 18 Nov 2026 06:22:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ3d-00000007sxx-2l5V
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:22:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwBA472554
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b
	5uu3L5/w=; b=StJ/nTMi116Bn2n3uaLjbDglrMXYmkOmt3cl4rVE8mTtyFYyFgY
	PIoaJH3lG1ucLeyMnBfKCxZH2sW/RwAmNgk8BLGiipLEGDAebCzyQcaaDFTadc6W
	ffXhMMHaQBQ5G3EtlvWG2uXM7Hf42d0x3R+xEPPwLI9R7FFmQyQPwvkqUOWx0hBB
	7SVpiNxAAKzYKE2D00yq8HYm2zHp9s4M08wK7MXh/cLCAeIsCIyFnVTgkqpjHJVo
	yKzQbZHTMKYwYVBcOyg+R8+fwpJRF+TOH1dbkmcjA+wjuaZ62RkmW6oY8sqyOJ7s
	qCSnAkTR2EKuhzF2Pvugic8No7rpBKjn7Mw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89gyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:22:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so624632a12.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982930; x=1795587730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=;
        b=JUJav6d7scX1K3aJt63eldQ0eD7UAqA8Ek/pVNtjhOBrPIRAIoWKsf3a1xZNRGGpQo
         PsqzIjISvPtkGDD1sD3UeDWnIHPJ0j6f8Z7w5tvljTm5ZYKq8aahRnhUmHZTGUwHKmqb
         EH8+xEpZ3Kna1bW1erwr50vRK9QZxIs9SGlDXxjFGagS93hquT5Un8zdS7dORKqORBH6
         4a7ZCrSymv9ojlfinhbCtRM0u6K2h1zELRsrcZ5qH4aicgkdo+goRo67O75XP1HiU9Qd
         tPMFRNFV1Kv0zTr7sHdXUNzuQNdMKgcuGBMK2AU/TmwD0fvkHXB/GB87X8o+h1BUWHY9
         Xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982930; x=1795587730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r22wSftw6QqLEA4uzVI3UhW3Cr4U6qDqT0b5uu3L5/w=;
        b=SCTUMRKbo29m/PxqOgfcWx17ii0f2LRy500zREowu8gfQSbIaG35lTZTfhyA5cTxUQ
         pzIaPCpy5DbNxxAtzMG0VijmFMc7U642xGgRofV2Bnd9tm7DnmYup23odBv0nKtq7mlZ
         D+h9FZ0/9YbiWT4ilha87M2THs3KGCusgfbczqFQMq+HwzINs1mH2Kqz3qrR9dhJ64KV
         XKOymLFtATzNRzhN/cag/ZhSrdi3E3EPIpEI6bvC4SeP4bDOVsg/FSoihwgEcx8SZIJg
         0lGK5VVj47w8W1vkPqFnc2fiLhixTNdSRXOlW38TYCW/gjINuySjIU7CpVmwXDCz8QIB
         g/mA==
X-Gm-Message-State: APuU4Z/YUUstCFpcKIfqko81Af+KDDDSmfTn/KuKxRkB4tovTh69bHah
	7Uz2YcxmzKm0CWa/n6s/GHdlsYK6hp66rIFX9iK82/h9CYli8yR5DKcsRX0X1fZOU2kRUoQRSBo
	CLJ683+0YjmEIZOeZD5+TUMWAConmFrTfqZsKJiT4UdN69+UHcu6Op5rNHW6oE9EqxiSo0EiX
X-Gm-Gg: AYBFou0TR3k3bUgmMW0dKFd8ZC8i7mfqak01qo8VZYXXwN70ptrHVlkEY27ZSq0qxSf
	FG5Q5F5JNuKKh3Q8fnVtyAtbAzWdCtlZeSQCAClpkGqWte5GtcrKOvWOprcbHwJZJnxSPmjHENa
	1BqanryMHw/5QHbM0+xF48KTSzg80sDTAgt30KIJk1yiRyWjbW/pRda6uRG99Q3Xl73/qzl60yj
	91fBD3biX/mPCkzPySboDpsOkHg8MamDUm+/S7iCdXVrgXlr++8A4oteOb5HANeh8CU6i/05TW6
	2X6fQxsmREmy0Trgn6bBDH2aQtQxPvf7KLK52foP7t+DmgetHkd2lyi4T8xUH7Jc+6GHcEVggjl
	GEGseiIYB6qWTdbea6Z2jTr09bf4ZHCqnvpZNezLJC/RgPN8/FLkYrVKc2OobIsxbmyHolqzGcB
	lmlQ==
X-Received: by 2002:a05:6300:141:b0:3e2:a849:64c0 with SMTP id adf61e73a8af0-3fe8acf786emr1864294637.51.1794982930590;
        Tue, 17 Nov 2026 22:22:10 -0800 (PST)
X-Received: by 2002:a05:6300:141:b0:3e2:a849:64c0 with SMTP id adf61e73a8af0-3fe8acf786emr1864279637.51.1794982930170;
        Tue, 17 Nov 2026 22:22:10 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2a4sm619916b3a.12.2026.11.17.22.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:22:09 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Prashanth K
Date: Wed, 18 Nov 2026 11:52:04 +0530
Message-Id: <20261118062204.2314394-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xu5f7oKaBT8Hfk5U3p9QT5eK10W0u3hB
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd4413 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=r_1tXGB3AAAA:8 a=zMqgFnQWW24czSXJCR8A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfXzNiA2W/Iu+3Q
 8QQaHhHjrPuJ5b5TuffGEufmm+cmhaqdKzTeD3RvUPxhOw6JMrYkdTtbcMOyI1uHTrUD6SDTUvh
 9NCqviWDbWEuko3uuqkSuiFWZB8mJRAbL15FEvaGyvZrEeCrft+nGwKBrVmlYIHGU3r4GAjDqd2
 l4Xx7lUD1yyZkAQwf+FZulq/efrwF9sMZ5ORNzmg4wnMI3ScYTwtvG+1G3YLuXnsoh5aCKgxXrn
 JigXfLWbTuABU1IT4eGWK03g1p0M16wLlpA5nNDPFyNFhxg+2nPOgBKlSw329B4b4Idy3OV3EHf
 Fw/dE9lPRaSjhAcwiwZVlCbb0dO7rSS1prxDNalHqObyUI02XZdcBwYSjUae+YBqswY3ZK/e3v+
 pv09vnNI2NkGuBrVJlL+Z2whv8AxR28l619d98X1VuiJSwOgSRLQ0i+dqoKDp8V0iCompXGMaOo
 apyx028fSdPQTaGoaAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX55RN3SF9XeON
 OQ36kFfeXeH3mU6XPSjh08ZOYnnDR/U4kpuaaLH2aJJQBIlC2WF2patWm998oRqOzN7nmQfCkq1
 xIXstdGNCITfTRNs4NJLukcYgnPLXaw=
X-Proofpoint-GUID: xu5f7oKaBT8Hfk5U3p9QT5eK10W0u3hB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_222213_841577_321EC25F 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index bb8cd0c84747..f26a9beba759 100644
--- a/.mailmap
+++ b/.mailmap
@@ -771,6 +771,7 @@ Pratyush Yadav <pratyush@kernel.org> <ptyadav@amazon.de>
 Praveen BP <praveenbp@ti.com>
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> <pradeepc@codeaurora.org>
 Prasad Sodagudi <quic_psodagud@quicinc.com> <psodagud@codeaurora.org>
+Prashanth K <prashanth.k@oss.qualcomm.com> <quic_prashk@quicinc.com>
 Punit Agrawal <punitagrawal@gmail.com> <punit.agrawal@arm.com>
 Puranjay Mohan <puranjay@kernel.org> <puranjay12@gmail.com>
 Qais Yousef <qyousef@layalina.io> <qais.yousef@imgtec.com>
-- 
2.34.1


