Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F53BCA600D
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=; b=c99aElaAapSMM+1hwGLAtXu4at
	r6hZnqPVltpn6CnbzXkgu4XWbMvuFKf93FJbcrUREeQL5EMOIIofdczwUrwfD9P3IooLjqSw0UGJo
	1vLxQOZ5jxcDggIeJ7p8t49mPiY8oUbb+lm014S9S/eOpiUrkq+0iPgA7Lhz6yPvWQZggK2ZKm4Hz
	Q5XpTp+A7gJaLKKMwrsYA7kxoEuxc+/TjiiVAMKrlk6qcV8Jp/X8BdeWCr7KKye9gukLFe+tICs0N
	5u2Ou2EfdebSaqkMARZBnJaTF924jyQbwHzYXEYo7NJ5DeoP0yi4HDRnumbmoZ/2WZyvKUPFsZe4P
	tx8rh3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGV-00000004yvo-1iYR;
	Thu, 08 Oct 2026 19:58:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGR-00000004yuV-43Sm
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 19:58:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HVd7c3197317
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 19:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ebm5pPz/0g/tl4YeJ3Jr8z
	4GlCJlRVCE4c+RayxNGYo=; b=TSh9G+OsXhfm89ob9xVjQRWC/oY/KUteaDdiiL
	nPGfiBycxAbaJSuvQ7GyZ4IeiO1mqqgjlukzObzRDj2EXmEaEXHmfl1kaQO0shHs
	qb+yI/j1GsJxLe0zBc0exsG9Dg0hVgYfkwduqOMHT0cWFYqECMYIWBHytMd85R9B
	6/P2b0xlkjPw54p2Kx6hgRSIywmsPIFaocA4wFlBjzvdIHRLoaebYyHLJQIwSrc2
	lP8HDjYHxLKZQJyoMgoAwH+6AD9svbgk8H8ziHwldNsXXR2x64aHuqCgVyjzcOCn
	E/afPiJPcrVFlxHRhjk+JDNx8IjwcCFzohn2ZjxC83PJH1fQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqrgxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 19:58:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef5fd7934so15120870eec.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791489530; x=1792094330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=RftPXkNeoF2Y71XbnyitqBq2GCvzSAQV9hLL9/DnbH5Is6CGEdqcBcQ1X62iw9L6hF
         90+1WECixevNuwOYlvvMuVHH8l89r54olcSbb/xLW2DxunjUnU4erWBa74APYCrGprSY
         6ZGQL8a6RPnodH+WpykNtQB7ZFsWYUP9WgHnBDv5YiPuduDMcXRXgaDdNJtGnBew20x0
         twGgRVz4kL4KFZtZXYw8kqSPAgTJx8nBENgScoAvxWQ4i37uFNt5+be8tzjEBqkEeucy
         FV3SrzKK+66JRqJ8JaquOsR4zm3Lt54QaKwGM6wNP/X1y7nXU4uKPKtcTiGdopIkMaH2
         3zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489530; x=1792094330;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=JdQwVxgFYifow8xUGK31InNd5JuD0pN/ahQ61TSErXQ0Ed7INHYs+3Y56w8G9DIvu6
         MBA+JJL6AWlSdtzdhadmdjVPvt/Oc1qtrgqQJyAt9PSf+Vl7FTfXBV1xgtg57cODJVwl
         ojPQgOmCGygGZYxE0L3KVAl1QNA+HOWOx4JR5yJoIlB+NOziUSlRmihL+/cV/IWC0oQb
         6TY3w8OqT+2a2FcrMU78szp6Z8+eJlX8skkwsmofCCgvIzntHKcFWoad34eunPmHq9w+
         bkQqM1JsxaQliLTW2GwnGxcNJLc9dY0+kNN93NW//FCVvoJMEnZyySBgO+c6Nx7ZEl8T
         2Eaw==
X-Forwarded-Encrypted: i=1; AKwUvBxN2tg4fVxjBQoUZvMV3Nebe4Gmh+Rg23MbeKgJbB9bPpwtY4/6PnViF0H08Z9eqasvLVkc6s4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLiLpXFINNN5BHRjs5vgGvSlfcZJxYiOY+wbnVhXPJjOV4/7cHo
	TqCQV7mKU3YQkyiGzhyCsIFlvtDWu5DlpSt7NvzEROeb3rbNxzNMAvMz8jj+FmKeuTcVK8RmW6i
	NUDHZhTL3dhbXTmUZPAUqUdoiQdoAVJROvmJFwldME+WY3XAggzXmiRb2ZBlvJA4+
X-Gm-Gg: AYBFou3UZlpkfLrFA180KXK4U92T9TRjN0pHELQE3zHdnLDIPpKiCtjbn0caucnATlT
	2b9xj6/oDKVxMRTcUGPrYwtrP+Ya2G9sL9gDMtbwIXUhJw6x9jeTmqo6Vs186n8LE69EPxaa1AY
	PeR6DJuJzls4bb+J85dv3xY7anmXmUk/PDAAEUY5ciCnCOb5vJXOAOpaBVwt1CU+seAi6MEC8wz
	MSJfOP1kbNrvEb8oEdtyi0PO8hlNphPlPWxz8ORiuEwyw6l/dgi7D7bNoFtxounpFS1+JNFCAlP
	vlNXhEA6B8+gFWDmvutouPxC8F6fRAP08tdujQnwRgn4vOl+AAH6+ruiO8QnhvxYFnTEadTmmAJ
	Yc+Bd4HpsgEmFlMjlzYqHWwJFU1uDIQoXOTw=
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053373eec.37.1791489529776;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053339eec.37.1791489529022;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm231759eec.31.2026.10.08.12.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:58:47 -0700 (PDT)
Message-ID: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:58:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261008
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfXwWE9koO0r6aW
 z8WeGU9GKc/XwNp3/VbBHw1d6BR0AHKdJKeg6Mptj+09afTEjvpTn6UVlH54NxRl0wlWpKE5c58
 wWiYN/1F9BjOaKECkPYnMtDfALfeePY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfXxL53OMTk/frf
 xxEwd7RHNmWBMGce0qVi2AWEJjFsL3w4DBJBrFXLTi4kALHjCjZ6kcGLu8P4IvYACB62EQ9FzwG
 FgBLat78DBiE02WhHSgpphF0IFEbX/34lxLmEe/HSmSVYlBrHQmellE70gyf44My8Y5M3pHLivo
 5uRfOX6Hp9az+WqyUWqcplmIV9pu+Sdm2CBXDwVkaj3+jk9lvAdtt2g/YqUVMj3dEXCrVA46EiF
 nURggGf3hg7peQhLevbnH/5cVsqiRWKqpqMBlUhKtgsYJgE0cFg0RBB4TlY6PKoNEz1V7FTiBWB
 g0Gc6PbZXkpjE37kiq3CfC16wHIPL6VbIrMSG/IkrLcBhCCPERl21oBbOY5UtsYhE8GuO1DMxvH
 SwstLoAx1KoHGQbCzqgOisUCaOBBrnjW6NfLjO+fIfFucTZr3cISNWrT1xShHP0YS2tFwM/ew0e
 HhC/2kc4gdFibgb7WPA==
X-Proofpoint-GUID: 7ffZCvRF3t9qpOv6baMIePw_YBdZm8c9
X-Proofpoint-ORIG-GUID: 7ffZCvRF3t9qpOv6baMIePw_YBdZm8c9
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac7f5fb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=WKo8ZlZ-uQDsbn5PVaAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_125852_119790_7E120269 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there is one board update:
WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

  Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261008

for you to fetch changes up to 575bbe3f83565d18caa73e9b9458f754dd286f48:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-10-08 12:37:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2431852 -> 2431968 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

