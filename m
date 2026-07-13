Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487A5C44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=; b=0IIaMO8hTK1pSnrs+bUKjSTKf1
	6O1rYYRpRunF5/mWfz7fvLuLF7BoUbNd7IZPdrf8Zl7W0IH8IjjZnYyJUsau25KjKTHRZAfYf60NJ
	tdRr4XZNbMZ0RXbsRKKIpBcC/xegvkgLVWV2Efpo9lA1siFb4Ce/LdpxCpW+1dSdv3hGcQkUnp0xF
	cRjtRJBYWKwqgnnTxg0MkRQHZmJsTZYoPGRzBLxVGrt16SkoEfRKWp16iivkFi8HYmHqsJ9XJGnG1
	/W4MEx+0jUW7YcQDKw42K/aOKOzBxjWXcg+0/WEOiE8HmMKcWSQMJcuZx5WPu36x4Nc3BaK3mQgaY
	2BZL20mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJVI-00000009yFT-07MU;
	Mon, 13 Jul 2026 16:27:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJVD-00000009yD5-10Q0
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 16:27:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8H9s1709211
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 16:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=; b=X0KeW06Rfdm3sDZY
	MbtyRXJ3yJfOdc3lYbRUbKZsLN8UiuUw65hnbBs4KB4cfvFDT87bUIRirqTFmGYr
	+eV8KMkm81I2qrBXCTpvMiu9cCR7nd4BQanq+VJXFrKbgPwCOS198Lbk7eNntURM
	9jRvmy4iu7UO9YzsA6iAos77W3ysitm14HkDMr47gt/Cc/SDGU2eLVA95uGCsPYz
	Mur3Q6lmYF3pPSoSTAEDmsoUwt0iMb7FhTNXs3RACCxzEh8mPL0b/fPMz8RPqFPU
	AyLqCVUHJoYS75cb06T+77insB9F6j6FswiLk56t+Lf6c2fu4EzYeG0saOkqpneB
	ihDjxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9smek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 16:27:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5123353a12.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783960049; x=1784564849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=;
        b=YWwMNNFMzMSc7AeGJX76orjY9s47QoF1wzGZhVQP6JStwDowb/5O6w1C9djMkvFfVP
         N9tnV2IIyYV44uenBtS3JWiyJrK2yOBsfO9WQmPP9tqTUcbVMAfsw3e2yiPfOfOwHjiX
         NFx3TnmWw/37Dk4gNWhTqzWGKpEC9wFL9AIDzkn9P7ickWcoH3CY0NUUWi4mZGhDJrTn
         fA9C/Efjw4nrxDbpXqle4mZf8zDhjwgNyF/ZHdUyiFhyqYDhtWsC6brHkR3l0DLyQr+3
         7iG+n2o0gfwX9G/whw7LQhQi3yzbmIFER/9/cQ1drmhVxgB4rbz6f5djwLqfF2dcQbpB
         cQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783960049; x=1784564849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=;
        b=RF31/O7GrJa1jLVO/7RCXn8eahztYJuuwgAyqDVEMQNYVP5Yz5BOFg8HBtSKYtgyR+
         CG528pJAD5FIJRBfpjtCAG3fwfpUvBwVAD2WTw9sDovSHhvqQSAyd+szC8kFBqO7Bz1H
         3ywyru5GDzZFKRhZ8+zigUZnAhpv2Sxr316QcWo7ks0wpd4Gq+HMzSmxNghRcnM3cQD1
         gim0r5GK7irMUuieFlHsqor/FxTBg6GFEvVeMbo9ZI2EYBhIyEXksNyTonONCw+jLHOo
         3AQ1e5IHWT8euC5QYgcpYJkhRm5YanXurSEqHZl88e6AInCsy56OylWkmVrxa+y9pJR5
         7x4w==
X-Forwarded-Encrypted: i=1; AHgh+RrQRuNR9xj8THbl+D2JSFt+5soLcKOPPZg/hCkWwfWp+RVmXF/YbMPZkbSL2fP8JXUHnIp2RMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNWnhoW/XRUTk/3DGpnhujxqIHtf1oH8RkPs3Eq8kofkwaZ6Me
	mLU9nWliOqF84IK7kTob6bu9i3yqVfySDzDWWFg8iinfsJbelBD+bV444Z3Jli6p4WQ4XOQDrnf
	brnTdG2FfGWtl1/VnPRfgFGGl4rx9/UT7HHjR9oDb2CSUksQkYOEHhgWh6RgCJhbPo1cLpgRG
X-Gm-Gg: AfdE7ckqhD9HrxXySJkvdm4bLZcDox6U77WN1JrlHgk1iY5jFS+hLkvKXN1/P4o7eac
	rrt/dgivmhwrbTiJS58bNGkPFwYT1qw/wzhRKsKZ3joe0JRLNmYboRRZhieYN8gGZom0W7mT3pU
	NFQUr7UmErK8EkM1ZjDqRqsdpRYkgJ+LEmXeLeeXYbfpBG8o58zkaFhXYelVAEaWcKudQm06re/
	wIjJbma1ARM97gzr0O9LWF5TuM5dRW6FeIsb35ou3ruD5a0COej5pTfWkO5JUXM6z1OlUdGAG1I
	6v8Lz4mH0WOA+bmMlrH9ahKVyLS7GfPmRKIQ6EqeXjx8sJCKGU5/t8toXdxz50tDsPoEqesCeez
	NspKrqdiBXsOgYjSJ/5dfV5Hc60ZSebYg3iDFDJj3xtpDxFpy7WWX+gFbhSEokdJE+f3M
X-Received: by 2002:a05:6a21:4593:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c1109e034emr11007099637.26.1783960049207;
        Mon, 13 Jul 2026 09:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c1109e034emr11007082637.26.1783960048822;
        Mon, 13 Jul 2026 09:27:28 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm28567493eec.29.2026.07.13.09.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:27:27 -0700 (PDT)
Message-ID: <2b5dfc9a-d2fc-4396-a004-4d3dbe30b408@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:27:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710155443.1761760-1-jtornosm@redhat.com>
 <20260710155443.1761760-3-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710155443.1761760-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfX420z/2r2purM
 5X57/9rvMnBqr/NbygSJMYc3isyE1kgXcPG6NbDYk9mLnVQ0VI9zfaX4LdOq6hez3YBsAduG1W8
 q358IThaoC+z3XLhLG5ndBp7/XQ9IKf9bbPviNuP4UnS2b0ysG+CPOilezQCgo2n/zsymC/vR0m
 INyv8Bj8ggg6JbQhmQ7IK0KzffdH/oQp7S6IDW++Sp8o+iQujlI6GE39MVY0TZp8X2lAAxNLV4H
 vEE0UpNYIZi/9YjUVnE2jQfOpHktypJFNKC5aTtLusCBbdoFn9Ver6ICbBFCIV0xEahf3A4VfuG
 HAQq88DeVc9gud+yTdYMKrpuoVtCjpIJsm66ptS7wUV17yW3QiUju+/Qm57+NK1OLx3nhFfozEh
 Zw/mKfNv413NY8a3+2FvGEay0qILQtD/1iJm3maqMzbkG0cbiCIYialNk6covqgnQPQsdONKXiM
 tic6zMkzkI9PyOzVsfQ==
X-Proofpoint-ORIG-GUID: WBPOCwCJr7RZwVAnQvglWfNAgeGp1NqQ
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a5511f2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=pXPxGQ70wQjSudtT1GsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: WBPOCwCJr7RZwVAnQvglWfNAgeGp1NqQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfX2aTByhQcMmss
 rqpI9MR/tMbxxoMkIt3g5dAdG0zTIIQcADpmJlFyRIYe5k2RsG0q1XNaSMs9r7eOVMIw4G1/r6i
 1GPpHuJ8Ura+FiLSG6vDPjXlN2/Szts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_092733_599636_123323B1 
X-CRM114-Status: GOOD (  10.58  )
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

On 7/10/2026 8:54 AM, Jose Ignacio Tornos Martinez wrote:
> Under heavy traffic, ath12k can hang and experiences -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems.
> 
> Implement a custom wake_tx_queue operation that:
> 
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-packet locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Returns early during firmware crash in the same way as other tx paths
> 
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
> 
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Just based upon the description I doubt this will be accepted. The ath12k
datapath team is striving to have a lockless fastpath, so adding new locks is
problematic. I've BCC'ed the internal developers list so that the team knows
to give more constructive feedback.

/jeff

