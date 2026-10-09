Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BFCCA6012
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxUptr7baz3x71Er2/PfT6FXq5ZDR3WhgoVZFSGIcC8=; b=V8ALLFxYeXXzuiLzoPVp5Zg4CY
	wq2qnFyBF1U6c3ITKlTWTUxRWZmFm57+te864kNsSJGvDRlaKZibmkwjggM7RbQusipWhNS5sDOFK
	QogXlLpYdxlQE+DOvkLu21glzceZoj041NB+HMmjXKLymBe8Cng/9YjPrLCMYuRk28/N6sLM7P9nJ
	LRU9+iEJ/mZsy+xTfCnw2e6ZzbyLtK5zYHH4QtkLQRuQlmIx7b7OKynxjpqKaPvLr9QhVpDMh1y+2
	hOi+6C7oq2J0aTsF0Fp4/9XoJgZ3ByS8tBsUhg91y1k1B9n8trfHusjgTTS3i2QmZ4VEm6MQc5IoK
	/oGY+/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7mP-0000000636i-2xQM;
	Fri, 09 Oct 2026 10:24:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7mO-0000000636P-1YcE
	for ath12k@bombadil.infradead.org;
	Fri, 09 Oct 2026 10:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vxUptr7baz3x71Er2/PfT6FXq5ZDR3WhgoVZFSGIcC8=; b=oVDbay1iuydI3iDUA67uw8hzzY
	RRog1LZGX1k63xV5Prb+aMtab4QzKdsum3ozj1ecIGrjWBJ9JudvF13mZ90R3dgeF72b27W8hNWG5
	bfa9nOTjKWCLQai1eqz5A9cZBzz7NQaXIEke0PfPgC5KaD1DwE9IJ5vc/G1wnMKWCE+G6WIoNdjKA
	5GYYQ9cZOnvz1qKww2VpV1a4f9QBL5puGRGsphi4bJ0UP2GQBg8EjZAKyZCeC95MpL1Kr83KaqHxf
	+HRTqxbb2QFzJ7uCY0EU6W7/RHQgFAznWKxSNWioHIXZXW7Ly/Q90HPAowCj0WMcA7QXbI4MqYW6H
	2wvQViwg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF7mL-0000000B7bd-0aUI
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 10:24:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KLpR404755
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 10:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxUptr7baz3x71Er2/PfT6FXq5ZDR3WhgoVZFSGIcC8=; b=DMm1ZaUk9fAc9DpX
	8ctHnGZVfDUJqczwJuY/KfEsV2mwvX0U6VI/4XnUtkd9Dy3OK6HGIRYTEh48c77D
	qrJltn3WmvuWd4728IiH/dCpz2Nvq+jkcy7kAaIngnB8hEMbTCvOf27ttCTS0uz8
	1qlc4St56NQ5CFDFlhzFnDqMQfogvPuPT2GHLfulBKZ1CGNUpWzSnFVUiDXVAaV8
	8B4K0AtBn5bP/2q7ATPVbqrIqPb4U2VXA5JhBzd88YEDiIPyXGuTqEAK1yAYFnQi
	ikKQSA0i2Ac/6TMxj3IQpH0ro8yLZeZhFmmLtw06F3TvjGa8HX2jeQtTz112pPvs
	gaq/iA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk34h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 10:24:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so5094161a91.3
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541476; x=1792146276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxUptr7baz3x71Er2/PfT6FXq5ZDR3WhgoVZFSGIcC8=;
        b=HinxqsS9vOqRGCHNvbVf1vBfUy2LGR0RAFZWZ3SEbr9A1grbRlLcMiRdQu4TwyOmFu
         5p6QBL540iklgBy1xKDxOc0qrLL1Ppy51dW83nVMXiaPvR7e0reJxLQeKsBYQATvo3wT
         p6wI0RnseeTblKBiuEhYPK2BVH3WCsH5UtEo/QJJ2GK1qjjsPAOrpkbPHsfxvFG+4LbK
         FRIn9+g21mDtKHph040NH61tnZSeCnN0IB/MMYievpJkikWLhcqrXpalh+/lL0g1HJzF
         /cuPnslEwUC0oMz1rymh9cYe3GwTtn1yY4gpcUekxe4XnXzAHcMyyBDK0WbnUTO14TmG
         tpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541476; x=1792146276;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxUptr7baz3x71Er2/PfT6FXq5ZDR3WhgoVZFSGIcC8=;
        b=qNu36TQOetT2Kyaygvcb96uJGwn5gn5wHVveMuLMimIcEzIR0uRSVWq4J4e28LA9Lt
         xDEEqCWKKj9J0jLovjLmZBPbN0ha62gnAMGmXNo2Brc15MrwxlEoGc9v4SabBOoO17ne
         F3FuQr4taqSC66SbJhaUJtgZOOeapnkC+6TKKMRM3Ppfxn4j1O3/G4pG5G96U600PItD
         TGdaHyJCF5VFBtlDNQER4U3hI9KNMuV+e5FcliKSX+DQZPabAQoCouJaRp6MDK86s2Ao
         lO76vBUuSodO6KmyQagrrifXoVY5Jmtitn9XN6Yg9TAduFKiQe3/Odgn0i15we7wiAcr
         qSzg==
X-Forwarded-Encrypted: i=1; AKwUvBzwcDc/mRipLhD82RNTkVREaygK2kyTyf0SUEfrUeKUGLdio1QmKQ8q3UlW1bizWq4REgc4JTY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIPZ1UdxhtQ0u8aKePLLQILk6OjVGgK6V7iGowIt3Dh7n/E6sVD
	x8gAlnVjtSAMjYDEJTgLNosRIXKVtAtZojNv6N+O+HHJN312eftpEUPAoglOCRi3i43rDC3v7SF
	V0Zl1JFPMSesMDGMIuCYq+0oxQQrzH4mdnIwHGTOxN1KvK7EYsCSLMqrS9JJUP5I+7XTLQsw3
X-Gm-Gg: AYBFou0ipVk/+Wnc97BjcqIxp2i9ERZMPw4WgbauaeOXfi3kE1oloAM0euvvfXNfATq
	DArp4xjkW2DPH4tfmzTEglZ1YLc/x3AKXG89nwNsHpGnaMiRe1ravTPxpVHrSYigEpWiniIV+cP
	NeFq4zvSLRQenQt9GiOlOVFyPE7y6Kgy1cnW2UDLOxCakDAGPbub16b9H1w1Jp9yunFPqgYuUF/
	etFJ6jN6MjKWc1BpfGwHLAiFMKzIGdSDyYGumS5oYraqZ+EZaNyuMhcJEfICuERF07OEnl8LNl/
	eXJxPUNO0YI0Yy10cUI7in5akiDIAv0pGWXKhfHoizFArUBuMEHg1imQrql5PjNPRsD/N9VG1ye
	7GowlF5xBHrw+ckywfD0F2kJiJOBMiC1dUXtWRiHlnmBzv0PH4PIkyyOJ/8+g477KZLsJGek=
X-Received: by 2002:a17:90b:52:b0:3a8:1cb6:9824 with SMTP id 98e67ed59e1d1-3ab3a239c24mr1399453a91.6.1791541476196;
        Fri, 09 Oct 2026 03:24:36 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:3a8:1cb6:9824 with SMTP id 98e67ed59e1d1-3ab3a239c24mr1399441a91.6.1791541475741;
        Fri, 09 Oct 2026 03:24:35 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm2957937a91.17.2026.10.09.03.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:24:35 -0700 (PDT)
Message-ID: <934b1a06-48ee-47d7-b985-c3e7221d7880@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 18:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: rely on page_pool APIs for buffer
 allocation
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh
 <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
 <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8c0e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=K_aUTmfyJhreUiukWNYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0dGLi3ttAQP6w-WK08Q7mzbShM4SDhAv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX/XhLoMdsP+Xf
 lHOkcvlC9eCABGm70Iu8DbPyvwUChijSY/DmB8nxC0VdmAXSm5Qd6Ebr03N9bBI/Fy5r7ro8HHJ
 fVN6SXufbHLqeq8/VFe4nCHIdmYCl1M=
X-Proofpoint-ORIG-GUID: 0dGLi3ttAQP6w-WK08Q7mzbShM4SDhAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX2hmC1qeys/8Z
 06rOSDtamT+wUk4uJr7tYwrrf4GMGb1rD4A+PNsWR9B7l79vwKv+l2nE5W2J+GSvlNPS8F2vBXf
 wb0jeMb5B9NDM5ua7in8vuTuSL2usC09Wg6wlyXnxmqqjJq06gf0rgwaO6M7XVrY69rYYAAsrgA
 /z3Ye6MRKJAEOJ1M1ITOlTRsURmOPApzUX92caP/GpVqFBrHURxgo53uP/vZylp61veBErgXtAX
 bHoRQqK7KqPdq5VW5oxT9+rrJ+FjBXX4Rq01KHNCHyZZkaiYMxFFsVmG7Fe2mNZ758pPKJIiHDL
 F56Ev7niJYphIKQrqm7k4b+aeb2upQ8tb6Z832GYaD0KBBWi1KYFRMbCRAzKbEHNvYwFORHgSzR
 oc6RrCC+cjeBIyHU6swsu67kpBAq7VImXw2vbxvbLY4rt3bwxHBAJo94XtcRZ5hzYuO5fnQ7AO/
 niQnmLlyGBYxk/vQ6Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112441_817819_1AAD7F70 
X-CRM114-Status: GOOD (  16.30  )
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



On 10/8/2026 9:16 PM, Lorenzo Bianconi wrote:
> Convert the Rx refill buffers to the page_pool API instead of allocating
> an skb with dev_alloc_skb() and mapping it with dma_map_single(). The pool
> handles the DMA mapping and buffer recycling.
> 
> Add a page_pool to struct dp_rxdma_ring, created in
> ath12k_dp_rxdma_ring_buf_setup() and destroyed in
> ath12k_dp_rxdma_ring_buf_cleanup().
> 
> Update ath12k_dp_unmap_rx_buf() to sync page_pool buffers for the CPU
> instead of unmapping them, and guard the teardown paths
> (ath12k_dp_cc_cleanup(), ath12k_dp_h_msdu_buffer_type()) against
> page_pool buffers. In the re-inject path, sync an already mapped
> page_pool buffer for the device instead of mapping it again, and fill the
> descriptor with the DMA address stored in the rxcb.
> 
> The monitor, CE and TX paths are left unchanged.
> 
> This is just preliminary support: the goal is to use a single page to map
> two separated fragments of 2048B.

why? please always justify your motivation in detail when the change is not trival.

Besides, instead of preliminary patches, why not just send the full support in a single
series?


