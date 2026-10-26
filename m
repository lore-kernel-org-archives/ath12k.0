Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66451606A31A
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 02:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8i6AHrw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLRZDSJP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiRn882y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SZAyvfk7E0t0sVIdE9M1d2Ep4UXPxvDDvaeVcSnvHyc=; b=N8i6AHrwSgyTND
	QMN4rqnTk0VkmMR7EtG1vEFyBXUffC6JWctZDp6dpfTQUaybwbeFJgQbY1L0HLdp5yzjGODo+2cqw
	+H84E1ZhBaScyABzE/wNn/K1oQQwbZ0y6wJiAIGrWy3gKhZXZE5vrg9RV1SxgJ1zlUrIjBfv9PlkX
	UxX1FOugisfaOScU5ze9gSUeovS09O7S3ntIrj7HlZqV6fbRd0ycYiYCcOIlOCnyhAkVFPOMyKKa5
	ZO3VZT9cFUXvqglYGKRRTO9lQMu8Jf9trcJ1Yoqvrukh9jO9uV52gCvbts3F5XF5fmRx4H43DhQlk
	UnduWn1kv3pFKxNuLRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAlU-00000001d6g-2FZS;
	Mon, 26 Oct 2026 02:48:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAlS-00000001d6I-2UD0
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 02:48:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KpL41620403
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 02:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZAyvfk7E0t0sVIdE9M1d2Ep4UXPxvDDvaeVcSnvHyc=; b=HLRZDSJPIy2LtPVQ
	EE4W9SLDrqNMi9EC6VvlrZMlaTpDA6UUh2HunGtO8NyXa5EkndAEwrgO8sWw7/Ql
	hultZPO/5f910B6PLToIE9iVnDNOPeBw6DpWZmPNkWa0Q69eBsst88vO0Mt1nZZu
	c+bsji0b4wcgo+mwI08rF836ZzX8tuFYJusVaHRgf0mKeueVQjkcweoScbJ1X9Ju
	VCN+BO7vymLTew54lPX+uvdwjGBofpxKhUGzR9AB1zOlBE33kruPZ6f8Vh3bKf1n
	zi1Q1nyqE7t9A9j1Zzqvdk0NOXXo19htzzu0Y9X2tv6VAYm/M8tpCEfNkiaDkqvL
	w9ckng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmjkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 02:48:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2346722a91.3
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 19:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792982923; x=1793587723; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZAyvfk7E0t0sVIdE9M1d2Ep4UXPxvDDvaeVcSnvHyc=;
        b=hiRn882ySWUbtn5RbBdO63FfHB6t/Iq7/Bs4fMmu5naaQ5OrXF5mjpJfyTmIeir+Ui
         Z9vWDHVV6xV0tXuJquYqabew4G2pWRJlCxpKbvjsprxRCqPMMM8DMXY6nqlGVb+9zQJI
         SIMdy2GHy/Yrw36SfShG9pjDGc2ag01HLmcoPYfsftaijKPnQyKM2F7vX2RX377xEZHW
         yoPWsUaH74EzU1PMzYA/mKFW6IYau2v86YxMSC1STpHx7zaLoRdgOKMj291x5hJpyjd+
         H1TMOXh9pcOmekhlJ9yVeG1Zubn9/onVKTPEPXEq5MCJztBxqH4Y97Skw2TWiTbj2eCx
         D6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792982923; x=1793587723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZAyvfk7E0t0sVIdE9M1d2Ep4UXPxvDDvaeVcSnvHyc=;
        b=M6zLhga0UJVuBtOk+tVQ85WG1QRDGZ/dPu3fXsXFMeRMxvtOKtPrSB1TonliVtB5ZN
         TTKI6pUnH2JCFkh/ic/Yh5egLo3dmVT94RD5PqSt0Qc0JhWP7592WmYG2grSJhIDS1TZ
         0vK/E9a/XrDNO6+i1yBf8j2NIraLtObaDg2Ymfl+HzzdwkJc/dU5VQK13nAbUsP2iNuZ
         k3GzR7u/PxftusKx0dmGHSXH/+UEfkxwXBOwtFxw0sJabSoHLYBNAbs2GsVlCkbY/mka
         wS+3BLtpdJi5PYKqPzu/r1emoVpfjnh8hCQiCfDwJRaHz1dwBnFGiqnAAdsCeBZmCelL
         MAUA==
X-Forwarded-Encrypted: i=1; AKwUvBx/b69eWUI/ZYWZttZzGKqHeyIeRpwyITPDLCZ3wpKUE4nsyxuv+oG7z1LLXAaLbIlCDox+Swk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLi9dLknS2aBTriZPR4c0qoGJS/nhpIhdaVY0k9HpY49K0fQcXC
	p/acSUhwsfMbjkKN59dNgckVFVi8Kt2xKfAGiNGGdrt5LEnfn7otjS5pUqrQbXnOPHoUAx6LIwO
	YJnk8JucTinw/bgDEYXONhcGpio74SNWMD1ljRK+QbqxTOQCYuzSj2hR4iuxH/CFy
X-Gm-Gg: AYBFou1Q8g/R1J7F2MsRI0jTFpSYO01wri5EMrDA2oPsv80bTWj8E83gbmFN35MXXXu
	s6wKILhQeaoji67MxS+jCNoze5ZejbDcpQsGdGoy5otU1JMi29Jnd/5VFAFwkU4qXr7rSzw8r6y
	VcAf0TNfP2VInq5x2AdU5uuPKmq0foK4wuSjlfClsl5nLUSZ1BO+jcCxbw6atydj0i5RsqEpm5w
	fVwkgrr5c3Kqr7t71Mszck/OaalUov/3iLqs1WF45DLOoAWWiw5QOoHcKwUkGUdYodEMTindf3f
	AzBzOtC2MqTW4EI3eR0+mbSXCu4WJFN8jY6hlJXqeFAaivInHX1KOmz0ElUGltvP8zmK9MlLcJ0
	wN9QOwAMqS3MEG2wmv72ic9DAieRVlNyQqgBcuUQee4Zucgc7KxJspyytjoN1/r0cP5y/h+FGMg
	==
X-Received: by 2002:a17:90b:5286:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3adeae763d7mr4770870a91.35.1792982923350;
        Sun, 25 Oct 2026 19:48:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3adeae763d7mr4770855a91.35.1792982922807;
        Sun, 25 Oct 2026 19:48:42 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm6430090a91.12.2026.10.25.19.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 19:48:42 -0700 (PDT)
Message-ID: <99323a63-01a1-4c7c-be68-516b3c1ca65d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:48:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rn1MkgT1y9x8gK-lEJLKZW6W373z6Zvo
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adebf8c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gzkGQ6Wf24K-XPQJ27AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rn1MkgT1y9x8gK-lEJLKZW6W373z6Zvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMCBTYWx0ZWRfX2LF9r+kFH9fj
 HzlxdhPM1BzOJsUD+u5jEKPafaqLbuyd7Lg9PNxR67GmUL9I/xeNdm/kZlNRDYk1K48UFAHs+Cr
 8b3nU282IwSoxiLk8PTQ2m9fcWYm68TBLmArPFlsDfTlgMjWRUKJNRNmQIyfTT/kSbkZIVVljmh
 vgczleBrFlM+Fh5bmnTd/81WhRMk2RyZlF+NHdzCH9sIp4tFtBve0y+9QQt5atepLHZuG8awilJ
 6JsCaxOC4NOfYKT7CEc9uKVHV1J7Em0LzZJXBOn79S5luPNDCrVfT77qepa05HRJwbnodoR8fLT
 k2020t9+mU8kM6NJLRgo5CxseRBzgT8R4VasihCpYzKQytoAJV7i8TGzUTLUO5/kG9t48ICWKHe
 zms8gixL/HeP4Bc93wnzgXv2YxinMpgD3vR86AsowgFGJ/r5aPLv01SsuDuo0QNyd19xiRyppjg
 RCh+HuicbpWNmJgsxCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMCBTYWx0ZWRfXxNjzi+2WqYqN
 7HIm05m7iCtYNN8kDcr5WayXSaR26wH3pSAoWgEmWnro7LteQ5Tpan4xFab0bb12908Zwb64sop
 kgujxvQ1Fzt8zxjVOjHvpoGHnczX40s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_194846_792333_CAB7E2AE 
X-CRM114-Status: GOOD (  16.40  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/24/2026 12:49 AM, Lorenzo Bianconi wrote:
> Defragmented MPDUs that are re-injected into the REO are mapped with
> DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> map direction, so this violates the contract.
> 
> The mapping actually spans both directions, since the host has written
> the buffer before the REO reads it and the buffer is read back by the
> host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> 
> Add a common ath12k_dp_unmap_rx_buf() helper that selects
> DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
> in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
> with DMA_BIDIRECTIONAL consistently.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Back in the ath11k days I tested the DMA_TO_DEVICE change (86a03dad0f5a) and
did not see any DMA API warning about the direction mismatch on unmap, but
most likely CONFIG_DMA_API_DEBUG was simply not enabled in my build.

Functionally, re-injection on ath11k has been working fine with
DMA_TO_DEVICE, so my guess is that hardware/firmware does not touch the frame
payload after the re-injection, which is why DMA_TO_DEVICE happens to work.

Still, the buffer is written by the host before the REO reads it and read
back by the host afterwards, and map/unmap must use the same direction, so
DMA_BIDIRECTIONAL is the right fix here.

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


