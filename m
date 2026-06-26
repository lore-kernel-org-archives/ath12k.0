Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05FCCD4F26
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=psSbIjkNvBr6Z+IlCpHYhWJ5FvKywc2XXemDP2v+LZ4=; b=ECD+6WjvyObtNVzLkROtLPNvW6
	s9D65m3lLkAzKyhsSL+CZVazQ0j2vZ5mozHMUdxgfNLd+/ybudVgrNcn4qcw3jxwNvgIujDl2Hy5I
	aAq0XgTlA5CXqPWMlC0smzC3qpUHS1pD7FnFWGGUZbZN4ahv26/rqjG+CZ2OsJzwcvF2/iRmeNZ3v
	y/tL0KDXzqs0tW8vP65pT78cYt46k2jBDEV9Ihx3o47ir+p1LupHHSt/HwmyK+M/DLjK+HCVfHjtB
	RUO3fLtvd+sxoCjYdyPFS8Fy433z2YhmaMDrOL8kDEu1qzKyf7s3fKU75BOykL6qBUuzxHxo1cYAW
	vL1+LbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J5-0000000Av1N-1Lxs;
	Fri, 26 Jun 2026 08:53:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J3-0000000Av0n-21Bp
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:53:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q8b8rw585684
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=psSbIjkNvBr6Z+IlCpHYhWJ5FvKywc2XXem
	DP2v+LZ4=; b=my98i/gb5q3wvpfC1Fq520dcGwaxJJm1wD2feB+rhBv3rjThYDa
	3jshs6ufVO7Je/J1oXGWF+oYNoWNJH4H0t/J9YYsWlQCVGxODgLOdjq/OXOzka4S
	rEjlXDejr6bzo7Ou58vYO0FNT/cbL687GHVXjKzAbU9qDfN37oqCRKkOTc6bZH70
	2gvDorzijlYQfDk4aodmVBHYlAJdhctXPH1Q8COn5roasJQn23duKpgwewSAJYQF
	dRfRSxiW7ju/+VoJ43G6xTDWy3KYR71oSNccfpdGsGKiBpYFW3oWbfiSQKKc9IAF
	HlM1JyJR6Kal3JTkh7emGu5b2WvEbLutpVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tr1ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:52:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4136eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463978; x=1783068778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psSbIjkNvBr6Z+IlCpHYhWJ5FvKywc2XXemDP2v+LZ4=;
        b=Sdooe1fPoju1ExMKR5M+eLWpKmER0WxDKOvl/mBiDVp1/DNLpbIAM0EGtD8jMFqw2Z
         LaxHvkiMD1i55ul7Bk2+E8bb7odrIAEq297CyzjNO9NUz2Nh6ec4Uqs3TY713mAh5jgp
         /lFimjjuCaUG1matyUD+2mNY29JQHIQBcEhxqk52HmMQCWtvay8Ac9oqWn4hG/ID9khu
         dfgOQITc5L8H9SK6p8dsSwDNzgyM9IF7KxOhfh8izejRPpbuy39BmvbSn2O7J4HJ1G9r
         K5/Xw31RKr0cu4++Rpg2+hf3UX9z3ybIFfcIB9sYYabuN0DrnvfcgBQLrSP2DCile4VM
         E6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463978; x=1783068778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psSbIjkNvBr6Z+IlCpHYhWJ5FvKywc2XXemDP2v+LZ4=;
        b=FZSwzf/6wlyHs0D+iEVuQ02a65rRJ0pYGoEqmQaABUkxZ8RX8k8JszWIynQHLw4EeA
         tbZv3Ev9wV6svJfDeBN9FMmrN2FQGKc6ut9sh88qAQhMvWDgfiVHr6VMIuFbhovPXjGR
         rR//P1zQv2JA/WHoFwVTicKPO3fwcfKuaRVfP+8uI3+kJAP8TyIi4+1JUa1z9orwifHm
         Zlhpn7Kub+w1glcFe9QibsoF5Lain+BJqb5vJXYzC+u4FU/kno0X4FrcBIYry9M6y4xE
         w4M2mZ5iiqOcPHU6+eC8/VFB/oqdeO+NSliCSx6TRuepY/htYDN1/xTeIxW4L7TGY7lc
         U4cA==
X-Gm-Message-State: AOJu0YxpABVxkLBRq6iHUG+xUL6QiSlqjJqNJC1jFvCg1vUU+92GQc8G
	Xg2qoa0sBtt7Ur4WNcoCWmtJ/0pYcHkpJknXBJSLwBngI8EMO1tBt/v7LVf04JDpB+oHhf1Oghe
	s9m9XR5BUFg/u81RYQQMelIBjYcNA4BMfBeyLgFaCw8frISXJo/ihEwk8zDtDkdhp66xCGVA=
X-Gm-Gg: AfdE7ckkfipehfpw1idDCoXvUElzszShr02DtPEs5AyWNUhvPnIlmlQOVS/MgP58VAI
	Qjc6Tk8pgZ0a49IjU4zlcky20eT7dIzmRO7/lIGwZ8RW61sbYMzif9xrfzKfXGv/gwf4FIX/Kyv
	piCQ+bUSJrm6SyEp7RD5rwYKXSZ7e7X4R38pf9dW71sxaXFQsw+6aVxk0uY/pdPNFwmDcgEIDR0
	lG0hhYcQUjj8NS6r0n1f+zySuqjgujwr8/7LuGsUDDCg3hQ9Q5fANZQYf18vH3ma1WvtYuYJFkf
	Gog0fy/x/vmXvlTp48IEf6v5kKi6XGiVLT116slZtb0Ua8kg2GCHVLyL/mJWpZbOVbrifKG8T3G
	SWYUrSsjdZfdAn3B9eQKRucy2Km97/R3flvNQXhIlnHIXWykznjirWSN88VNcGAlKSuRwrXa2Pj
	arK3AG1y9Ixxdgqxpnv1OBkqX6LWT1cCaZ56me
X-Received: by 2002:a05:7301:644c:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-30c84bcdacfmr5766326eec.13.1782463978341;
        Fri, 26 Jun 2026 01:52:58 -0700 (PDT)
X-Received: by 2002:a05:7301:644c:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-30c84bcdacfmr5766284eec.13.1782463977784;
        Fri, 26 Jun 2026 01:52:57 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm17384044eec.28.2026.06.26.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:52:57 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next v2 0/3] wifi: ath12k: Improve dp stats
Date: Fri, 26 Jun 2026 14:22:50 +0530
Message-Id: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX+pST2Gpy/V3i
 ypeZVGrjkTMyWWDvVckHnMUWmreIsxLirWiiD0FOumCnzSN0ZwMeCCxE8zK8ag68+vzbkFh4gbX
 61ZqBtEwJY4JHIpwJT6g8bggpWh7iRw=
X-Proofpoint-GUID: bgArMzBpuMiwuo7fJZLeTgQjlhoQzGY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX67tZjed12c0L
 opxdfn/alUh5q1NZkJzZ2YUNxwNQQCKKbwUYClVt331k37CrWE2PIJtlL52gVUrseXmySuBsrcM
 O1vFR90vZaPUvxUqswVJcbgj8mL+cLYXQgSnEDqTATFedDPxCQOStCLZw3X8UhBAs1bO1Ci9iGV
 JGshMg97VEChFRt8bzuk7mlORfYYdlUrLjXVDbfeNsRGRxajcmcrWklW20cG7+Ap1poGSL8NMPp
 TgYRhEpTgQQ03Ehv+R0s/P6q1TklljDyP/x2BOrwQYFicpkYmPhBw+pKBvjfIdlkocw96MMUX5n
 BJEd7TIcCWDlVBU+3hmbvIyLPBw0+WS9RpBYzrg/+7uMt1OsWFnKd6SNlpzd4x4yuB7KiZjh1p7
 dgbKk+nu7TD9QJennj/A8diu/hffOoUbEMV9tMeRy+zhX5IqDg63Hbc/rrRWM/tPro3+zJ+nCvj
 xRI0z4bUB3BzkOTsZ6Q==
X-Proofpoint-ORIG-GUID: bgArMzBpuMiwuo7fJZLeTgQjlhoQzGY6
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e3deb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Y7FTOXQ5Sh0Y5_iOd24A:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_015301_661430_4BCE051E 
X-CRM114-Status: GOOD (  11.41  )
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

This short series improves the device_dp_stats debugfs interface in
ath12k to produce more useful and accurate diagnostic output in MLO
configurations.

Patch 1 fixes a latent correctness issue where the REO Rx and WBM
release error tables were unconditionally printed for
ATH12K_MAX_DEVICES columns showing zero-filled entries for device
slots that have no hardware. Replacing the compile-time constant
with the runtime device count keeps the output compact and correct.

Patch 2 prepends a ktime-based millisecond timestamp to the top of
the dump. In MLO setups the per-device file is to be read
independently for each ath12k instance, so without a common timestamp
it is difficult to verify whether two snapshots are contemporaneous,
making cross-device counter comparisons unreliable.

Patch 3 extends the existing per-radio section to report the center
frequency on which each radio is currently operating.  This allows
the reader to correlate throughput and error counters with the channel
without having to cross-reference iw/nl80211 output separately.

---
Changes in v2:
- Rebased the patch series on the latest tip of ath-next
---

Sreeramya Soratkal (3):
  wifi: ath12k: Use runtime device count in dp stats display
  wifi: ath12k: Add timestamp to dp stats display
  wifi: ath12k: Show per-radio center freq in dp stats

 drivers/net/wireless/ath/ath12k/debugfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)


base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.34.1


