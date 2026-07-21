Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194C2C44529
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 06:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLkC3kwEWarNnqA7wdIi6MKhNZVVDXMKgzTxlcchG8k=; b=RNzMWEjHQKGWC8k5ZwlV1fyfsR
	Jv7FkO8Mtas3KcgqxxJniRvFh6DM2of2fSSguwnxEAXiZ+4oMaEybExN3VtxiPihUU34R3SuztC4I
	i0NUP7u/Apu/JTLLLP00xj0txrJCOGfTiCPrW2mAQOAn+/0Di6HcziLWQgzoQbPKJn53CMtTs2RXg
	Kbxa4swstttpoNWJDuc/D3aRq2N1xiH+hNOci29xc73CN46IPFM0CNfYJJLzIb/AzwbRfCb4sKnd3
	Rt4J0FCyA7Mg+U2BdE6tnWjUj21l3VlOUvNwM1z8Pf8GLP4+wVJbnwKQ1PZ/OjbDlTyMP9RtHcezb
	wpbcYjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4JU-00000008ZJP-35tw;
	Tue, 21 Jul 2026 06:50:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4JR-00000008ZId-3ckJ
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 06:50:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L464db037670
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 06:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MLkC3kwEWarNnqA7wdIi6MKhNZVVDXMKgzT
	xlcchG8k=; b=YdMODnOdC+LzfNcE+8xcGtAqiuX0DCfhlMVxa/9csY5475eh6/9
	HNDNDdIfp5hAZy0IIe5/FzijPiogx0pWz3EzY1mXd0EwJUCgepVeMLq45iKQZ/pa
	8rF1CJ4FDWKK5zZ0dIac4qkwfhW18AlKZ2lDyEYPC7pF8+OrvQa/qxLCY+oT8D40
	//NNZLRoIGdGIiWqNzuiduPw5yh0/vV5N34z3qTgb+Ei3/N/HwEzswiSBnyhFm0a
	xn6aVKFjEfTfpLuIpDWATo+MpE5g6rYktWrKB4VHvuNnF2AATHCh3hMrtoY9jdc3
	qUbiSYTLoywMuEuuOaAjwzjOIFAzd+Fru/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es0kpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 06:50:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a3514f912so14801843b3a.3
        for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784616644; x=1785221444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLkC3kwEWarNnqA7wdIi6MKhNZVVDXMKgzTxlcchG8k=;
        b=N5x+o+mvVGuNETwOZ4J6WEnTpqmpyU4GLa1owL62SV9iFXv0NV2S9+RZIY7Nsm0e6u
         l3ybtR7am2OxmZixFjyPItCGbwPcMlLKfhR4X4O5TsBwhndq9Z0xyeKu7lD2hvKBd5E1
         aR+oXKdzHBZFOdMk+YF80ubmjrXfVmIhFrViAuiDzgvXhtMYavaggdkIwjIqpJL0o7AN
         INhy68R7GTGSDOc4EVZh1UZ+niLzpvKHNzP6VLKULYS9/5B3kA5W9L1c9KvZT/hBM2nn
         mGz3Xh5HWg6ZPRYXgJ8gO7CvRz4FkQmBbHE3OIUzE67uyv1cYpyJq6ajkrYWqHbZT1b4
         j/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616644; x=1785221444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLkC3kwEWarNnqA7wdIi6MKhNZVVDXMKgzTxlcchG8k=;
        b=LIkvMIBZiClKhOQo/SyjIjrcF4yAiQ3tzw5M/kcjxayt0NrnlNc3PSbNbxwrrUQVIf
         pJQ5RQz80Tu/ECQOWUeC7vrb7ByyAQPMoPyjz/rByNC4Vee0ab5IhXO+cNeo8YtMPe5C
         ujV1mGtCUJBVZwXb20J1GXCxVKTxcN4waV4na3t0+3K9TvJinBkKcyQ2fhl6QFO3Ug2n
         NJfA/XBWKBc0IWe2RE2xyQmWuChBPO7KfxeNXJE37CShbIKmp3uKyl2JMUHUYENyMlDP
         HHd8ARGDJyQQr43gm7iwPT8KoaDL7lntn5ZYBP7ScF850YH46n/rB4n+9xg2XRss9epC
         sqYw==
X-Gm-Message-State: AOJu0YzyrluCm3JDJkEsH9hXoXjl5fc+Q7FWDDG629DgrQGbzSy+AolO
	sTmSaZysh5pZ45AK5T3JJW8xCmUXrlNGXr0i0tfeQEK1LQfu97HDfn2xoH9CMCsCW3avoq++zu9
	nVZuaOpMCW52j7HuKkkVH/BnhdaNX4deeuozpWSX//7XNy+Jwq+9VfSFQyvW3zwkOtYI5JtnQ
X-Gm-Gg: AR+sD11gXuBlpeRjhm0iphgZkfCHsjgJvZYfK+aS646XvHnmrMw3NlEHqVfYe1pAvDK
	okGDsXyiG9F8qSMYx3gc21KlNdM30kb1usokn3Q6laexcBrjPTksE8AAGvDSZZZuogqh21r5w8a
	L7I00Gx8pJ8DeYL4LsWyshOXdPitlq4RJucDVcXmZkwoFIVfsCLih4jGGVsOifs4ijNlv98PtqK
	wB8tCfIgFXQ/xDkLcgfJlZd3fB7Sk2g6w6aY1rD4ccqUWPYQX31V+kqNbAADvpoPgOToWU8Q0BV
	kNU2Ex7MG4XWgWJkAZpLgJkfnjRJSyl6SwoTPVrXJJgj5kA9X97uQK0dJ7qxaJPSVwFETyem2Mc
	CI6CxUSWG5TCc8gpQa18IvkU6wHSh9B44tBLAg8otM6LirAtwQgJaOMqIbAIEU+u/SBXHrGvB+4
	rqg+2e3EPj5Y6SG1Hc0abE9dw=
X-Received: by 2002:a05:6a00:26c2:b0:84e:6b5:e959 with SMTP id d2e1a72fcca58-84e06b5fa0bmr1057005b3a.78.1784616644333;
        Mon, 20 Jul 2026 23:50:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:26c2:b0:84e:6b5:e959 with SMTP id d2e1a72fcca58-84e06b5fa0bmr1056991b3a.78.1784616643856;
        Mon, 20 Jul 2026 23:50:43 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9ef6dsm6902392b3a.57.2026.07.20.23.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:50:42 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: add MultiPD support for AHB platforms
Date: Tue, 21 Jul 2026 12:20:36 +0530
Message-Id: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f16c4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=b1_ylXVzjByToN5sv7EA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6mgyxAJtqRUpa7IqlbKbFjm8isM710GE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2OSBTYWx0ZWRfX5pd1IYqKB23Q
 z9C4pLqtNl+dWGAKRSN6Wg0d3fVNPrcT07URANORXl7zWzqM7Z6SAZRuYf458Q/etazAjCA8tJ/
 hi7Huha1gAXQTnGGJ//L+QjsT3UigqoWiqO9Yz8DZUuAaPYLc4KpqMQaQWKwD4zvPyknKowYCz2
 fj+5V2/49/FfLH+arjmJrOT5kI9YlteQSICiwygZGJaUDW8Z1CZ/Oj4YYLfJheRyeE0t4CjwSHR
 xALtz1cqbHhgRC+WNUfXvKSglpQ0eSBeHJFhtfqye8ZeA1wIVTrxEhikdQyS2X/Skqia6yZKnk8
 2RAVWbgI/WoZw5Qk/2SyVipLhSS/IUQ2vZFN+Inw8A/gCgjqXxsbsHDCKAasGQUNhUOtRxKHL6L
 5x1+sgO+EbLVGa07U5FlfILJ6K1EsDmlRrNsnJJdqZlJ2hNB8vPDK5wyB0hS1MNlL93GU0a1WQm
 Umc+JNXM28a+HOc8PIA==
X-Proofpoint-ORIG-GUID: 6mgyxAJtqRUpa7IqlbKbFjm8isM710GE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2OSBTYWx0ZWRfX4whzcLxYfjgR
 CZYHGN/Acgyt9fmTE/2bVRS3YtN6ltJFVAwL42s8Tx0bj0nNO8GqPf01xq0Iya6o32PP+gricRL
 y2M8oivJ2qZTIuq5El1VmZiObazVWO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235045_902739_A3B44D31 
X-CRM114-Status: GOOD (  10.39  )
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

On AHB-based MultiPD platforms, multiple UserPDs can share a common
RootPD. Each UserPD requires its own firmware image and PASID, while
RootPD resources and services are shared across all UserPDs.
Add the required infrastructure in ath12k AHB to support MultiPD
platforms.

The first patch introduces a platform descriptor to keep
platform-specific configuration in one place and provide userPD
mapping support.

The second patch moves RootPD-related information into a shared
structure so RootPD operations such as boot and notifier registration
are performed only once and remain active while any UserPD is still
running.

Aaradhana Sahu (2):
  wifi: ath12k: add AHB platform descriptor support
  wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate
    operations

 drivers/net/wireless/ath/ath12k/ahb.c       | 209 ++++++++++++++++----
 drivers/net/wireless/ath/ath12k/ahb.h       |  34 +++-
 drivers/net/wireless/ath/ath12k/hw.h        |   1 -
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  90 +++++++--
 4 files changed, 271 insertions(+), 63 deletions(-)


base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
-- 
2.34.1


