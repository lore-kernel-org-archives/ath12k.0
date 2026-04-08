Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC68410F9961
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=; b=t0N0rb6fwFX6f9Du9/mUrSkhdc
	R3H+NYl+LqFmuN9IT+rrAqHVcN+Req6x9sqpxO3CcIqICUHZXsaQSclcQAhFrmT9skFm8I4kKGhox
	HWixp2itVkdRIpA+2qR0LDVbUvWdZdwxq5qMdpicYLUij8ivMoy3f9oJVzBwB8woMRUUc2Cjf30Uh
	QkdvXyKKlPvd/nHk/du7+4i/HSV0hTRs2kVVu7S+AmyX1/K1FuCAkbNIy44KXvgWKLrqjD4f5WfWz
	ZsVDeOEswZkRojFThCE2ob9lWl3/BIIuV3rgyX5//zMwTmM2z390OpAeE5ysOxAn0OnpbDdOOa6fR
	X0UPzJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtL-00000009CXp-1TcN;
	Wed, 08 Apr 2026 17:40:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtG-00000009CVv-1HC3
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638G4O8L2844953
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gofqv9WBuYyuN9VxKxGkKG
	wTp+Gy1foUOIiV/v+fJvI=; b=pgCTKpW2pon0Z3JntM2ZX2JLNgSxCciidnvJn+
	wFvMIwNQLvhzjZUo+6YypRjYmu3yx8T9VTT2+Cu43mIyPkip09EwlRR4w7cix9Pa
	IdadODgN5Uo6nFX2CBjv1/LBELqktsPnP8XvA75TTWniXW3Q7nhgL02uajHkoQf3
	c68Jp6xt/lq89qA9Nn8BhuB2aZAwZzFuM4v+G6Qo537gBbr/EvfAf10Dx/Kp9EHR
	3RlzrviX3W76Qrm6z6vx4Z6JIc2Hy+0HdkBcN8vKmTMyYKqMWSgKzkUv9rgNdh1p
	9SX+ZiU627VXLGM991nf35yWWuUKGZsR6IhCVwAPcFOcjDkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hgbr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 17:40:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so119692a91.2
        for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 10:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775670032; x=1776274832; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=SfrsztqxYVW/j4+WwdCWGAt7Zrr9wKiyYmeyC0SbPFtPnjwJ3S1bZrrIVadfmLWRrp
         pX9Fv5tDWk+tB2T6V6I+Gx7cLYt6dCJ88Afo1AT7btBcT97vvuHdQUYo98VKroFcgiI7
         ZX3MrroTh8VhhpBcSSgFgjAf/xvA7u4tpMM8iV9CHjUa6V6ih31uVVGYq7OJyd+9nOoq
         dKzbuBU/FqXLx/x8XqLOalJ+03FrfG50MNS+37gqYtUzUFxZ2LW9/KHcfQFBj8RG0BNN
         LV4wWA2R1NzQoZ0jJ1/j2zT+rojEpMGB/V26JyRHFfPpCwQDEIl6/soDsVY1fTaozYDQ
         Uj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670032; x=1776274832;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gofqv9WBuYyuN9VxKxGkKGwTp+Gy1foUOIiV/v+fJvI=;
        b=BLP1sXe5w+Iaf6Rf9IrPxbbER7KFKWC6uYxkdFe1jKejxOzMOG8O5w/wQCSI41a6Lw
         ZGN3AU5vo/abIydzHQGozswMjUArorR45bjtn2UiJAjx4RFpAZzUo8qsziJ+3a/7u1C7
         fq10Ljm2ABNGRxXGQzuToTLQwZEgdylpdeUcre9CP6hUn5e0yMxclSMASHcvMcjpx44V
         RPJwlRJ5+MsDh+nsbND9/3b8g0c+qWib89quzsov//J5l9DCpQhG+mcbC+hY/Etophnk
         ZpLvKqaWK9B6F8kyUffGqHUvtoNc3NaizGi2i6wtFs+WDfMEEj0uys4+F3EgqIE0FSeI
         huHA==
X-Forwarded-Encrypted: i=1; AJvYcCWqenwxmorRwBXHPcjfZXaJ7ZDCb8rwsmCyYocjM+AWX23kO1+YbfcgS1G0fL9ZTw3Os52I/HY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOBN/rRKaU55aau8Pab0wr4fANbYkzGgdfhs7tYIOHBFwdJrlM
	FujD9HaZ/BfmxweP7F1I8IpcfcR4tVbSqbZmexnehwD06TnLbKfqGtSMrsYyNXx41Iwfi38F0Tk
	8qYY8wSH1LY4tMyxHWGsxXDRrZlrdHuRKJCpWk4AszbE+3nea1sA3Qej7JtPJKBdP
X-Gm-Gg: AeBDieum9OjoVU6hV0UgGrWisegTL9h/3dc8vfLVbIiqZ0BJs2H7onQO2icdCfEgP7A
	2cdKNAVyZ3zeMAVurat0KDmDkd4APz6GRErTzVYgGiZtmBplRANIjmPcN743jQkWiBTPcG7o4yx
	deP0N40du2xtqqn9M1cXhVsxs7b4Y6Hlethj+FJcjMajkGx9BDb9hceZxVMQnI3faj8IYBTDgb3
	ScIOn+++VQ1b5grwBCtqXsERi8LMnmsPtPYOdyghSUjwRjzdPjICIGS1N/ZSEE6jAZrYOzXkiG0
	hd+3ZPvIMJpe1UjbUzOBUEyzobJew2hfsWjM9h417UhqA+fDNPZLGIpJbc1yP2L5wVQW+q4KwFv
	59U6xhqUZD27eEdCjG20dHZU2KFWX2RTYorSwBFT6Y8ZZby9v9XKiVMn+hQ==
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267762eec.31.1775670032046;
        Wed, 08 Apr 2026 10:40:32 -0700 (PDT)
X-Received: by 2002:a05:7300:a907:b0:2d1:93b8:bc81 with SMTP id 5a478bee46e88-2d40eecfdb4mr267742eec.31.1775670031453;
        Wed, 08 Apr 2026 10:40:31 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cef60a435dsm13465207eec.10.2026.04.08.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:40:30 -0700 (PDT)
Message-ID: <aa4cecc7-d5fc-41dc-ad36-80f010e5f426@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: pull-request: ath-next-20260408
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d69311 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=WLBL4ONXHNtVtiLGnawA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: NFZFp6Gp0lp8Ss_9tjZw31WJRgIX_vFD
X-Proofpoint-GUID: NFZFp6Gp0lp8Ss_9tjZw31WJRgIX_vFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2NCBTYWx0ZWRfX8eevKsXbHDcA
 qdVJnTQtXgaEQ7YnkgnR5qTawwoz8wNLCELFawCz+lP/PvIVjdnz5wh2OeX+NBmld8jKKL8B6Vq
 VvoTD313s9QFpjzHvY55/y6k8GzRDoltPOs127j8XWOuBJ3SXLrc/wNfdT7wgvyemmRYyjwCehG
 ZMK47iAjVG4N0jlszZ2dfkzI4Q607cIBmVKIu6jzpckbkVImCBotQGATr+T0RgTbSEVFAvQgeAs
 N6Yw/FrON6/yRG6cseKuXhSHZ5lmE4bnyY15L6Nv9G793BTihXiGBg945RLtdbQUI3lPykYBZME
 yuaC4a7cjG25fD0hFNIJhGzCyABc7q8g+Dbfx8bKErmeRyO/XAepMbuNTnMX02rq+UwkqLUxuo9
 Pljd8+v7esDi+mKOenNWZrmwAr7IvEbwEk9WGkPZea0g51dqF9tDnKrrD/LBwpNcrxGTefV3IhJ
 +ILLwd07Cvd7F0xJFRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104034_471569_631BDA33 
X-CRM114-Status: UNSURE (   9.56  )
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

This was missing a DT review when I sent my v7.1 PR #3.
Hope to get this in the merge windows since there is an in-flight patch
that would leverage it:
https://lore.kernel.org/all/20260331-judyln-dts-v7-11-87217b15fefb@postmarketos.org/

---

The following changes since commit 8c6d03b7a249ffe85ba2bda09a2a7614c0ff03db:

  crypto: Remove michael_mic from crypto_shash API (2026-04-08 10:11:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260408

for you to fetch changes up to 6a7693873b20680a3c33bae0c9f9cb3185f64ade:

  wifi: ath10k: Add device-tree quirk to skip host cap QMI requests (2026-04-08 10:13:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #4)

Add support for an ath10k device-tree quirk to skip host cap QMI requests.

----------------------------------------------------------------
Amit Pundir (2):
      dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      wifi: ath10k: Add device-tree quirk to skip host cap QMI requests

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 4 files changed, 25 insertions(+), 3 deletions(-)

