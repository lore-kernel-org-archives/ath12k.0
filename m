Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B540CDB46F
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4eg/8KeKJ2ZFZ9C+wf3K26eTZdYYjACoux+rrZXgDY=; b=yQ5TE5/C71WM3FIF8mwPymQqhv
	NGDHzzx6rslyRCjB68Y7w+jqEhlAzgSKvn/SOuFy5jmT01bnKu+tzh2++gKjtrs24ej7eNNduYqVk
	6Jn7cM5HGE2isuqmpoES/BX12IZb9SdD+VZTsCfbVEKGaC1F7x6lxT6mnzR+YGdnjVrhPRCRFCNUF
	alXkLD4MpRntYET2yzYxol+DrPVZuPhlhqmRFueTJoUtUryTlCAnIbwUfjJ/xqYpdr2X51dBLgU+E
	r4gEaFXaz8k5THQiAxfFVOnn8RcKs0ukHJ65kPIOotRs0/dCHpjRz2oqqR/4mH88Tg0pR83d/Wy6v
	7QWBtd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbVa-00000004noM-36q5;
	Mon, 22 Jun 2026 10:04:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbVX-00000004no0-3zJP
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 10:04:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BIcY156864
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 10:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4eg/8KeKJ2ZFZ9C+wf3K26eTZdYYjACoux+rrZXgDY=; b=GV6aXRnrGTwsvNjN
	yFk9MSz2x1E8ZtnQkyClSaJH4xuElgi2XMp4gtiFhjKITAi0C1NvEoPW9ecosC/l
	PkGYccDWGB8ZWu8kfFqpyR7E0auv8O69/iDTlpG9ojs4ZaoaJKcYvSdHrKrrdtyv
	99KR6vumr7VjV02sYQZn7b6a7aKAeFckN2iIoeQ6Z9aDtZ+BGXMWpCDH0dWzKfGA
	Ggr5JVBGrI0xvA+1OFXSDuGBaENa8OcaSfCCPxGCZOaVUb3GhVVJqdErHXP0RGzI
	fImPCdHlcvrYnqXvSK7j1DDK+KJhpLEosxiy91ark53m3FM81d3Q5oorLtMxGxZm
	l0AwqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mp9jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 10:03:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2945707b3a.3
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782122638; x=1782727438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4eg/8KeKJ2ZFZ9C+wf3K26eTZdYYjACoux+rrZXgDY=;
        b=goXGxgggHeqDKWxQb8ubw3oktQMPG9IcTQ/mxX/pSObAZXk31JX2z0f1TnqC9ofpVg
         /coKIP75l1CzWHQsJ6yD9zJ3b6CRA8EfXcNbRWqqOvx8xQsoPxNTAgblKViHk6CaGRLw
         YY2YmkOArppPULtaQKXTS9sQRNCvg46M9Nsr2+WXiBmNNonbE6DyJSpCbS1fZXdgvvBi
         +zSlZUl+foJCOiq3DSqHgJzBEcH/ZFkMDbNkEz47PadEe3KEp2gQilgC0KrolBjNsFx2
         fDRcCNaLRJFU7PVwKUsIE8Wr+8sql9nEE/70sDfO3cjwleigeA8RuOArry6j4SQyC3CH
         D14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122638; x=1782727438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4eg/8KeKJ2ZFZ9C+wf3K26eTZdYYjACoux+rrZXgDY=;
        b=QsazdFJnL9LrrDFl68ZkQxrkczpwaftIYE2tcIzSfAT+kqHPwezMQzhrdSHsX+RtpF
         RMyN/BWP7CmRWYooGTQ5c8D9gcHSgGDH+kGn9hl98VCqtc8kN8Z8kPGLM1EIdl7uhvRO
         aO/2Y/M0s0Ss/EsQp360nhMik0/waUQm5hCdFlu983WvkRuNv+0fz1UnOaS/+jwdKW38
         EpCZVv/uly8x+XocuzABOqT3Di5Q5ozuPRDsI/h3wnu9f22XJ21VXlyhyXkm2RRzmPvX
         kU2uvGH/bos0cd/HJai9rS+H4433XRMfXBmnmkrZOliIZfqaB4yB5C3rHRHtCfw5AaxF
         bmjA==
X-Forwarded-Encrypted: i=1; AFNElJ8WJOymbTvY4GFO46NfhRb1p65VU44pgz2otDqkWPZgmW0t5q1S8tQ28v717rb9cGlP/5nSv18=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9w5QtDsgAtglTfXyQ81J/YImtPb1fYWRlMpb8qFf707RdXV+
	S0oxGagAPLat720R+OC3vhHR/fDd4B8Qd2ItfZmq6JJfEac8sGb9ZEtoz6D0Z0XLq/84PukNGCS
	GmZfSBiuERej0S1eQE4W2KRdzxxnuLw96nhEbm8G9tnoTIBU04MCf/FX9sGxzzte0x4bNnQM6
X-Gm-Gg: AfdE7cnqRIMFqlgoAjre31f4ccNHBaQZZ1etcXqfdykc0+LdVmDp+jCRme9grLIzM2d
	jdx6armtD93TpHH1Iziop39K5fjF0+BJTg17B8djezbIMJVR12i41Ti5iWAJi9/ClLUrRYesTqQ
	lVnth7aM9rP+3Wg7cSpKVEAgBTwCo3pDDS37bWnhVZid55PqfVNvgCsG2otFK5rJAe25NdE+tca
	qe837flISvsk7UfeUYJp90IC+A+Fhs5H80mDqnd9uG8EYt1KhYfkPIpgGs5131BPMBB056rgSXW
	mCPa8eIlQorG3JUR+DUzngkXDt+RgjtmKqftIBAJfMGVK0JCVyIOks/lvyY2lQ4SVr9NLsM7vbb
	zB9Qr104nZbdIeClAkKqNnNlr1AnxCUekGOTp766TYNujV0aS3hxibIXxOU93IsSvqanyvbPrld
	h20X1M7C11
X-Received: by 2002:a05:6a00:6c81:b0:845:371e:43f6 with SMTP id d2e1a72fcca58-8455077c6bdmr14400579b3a.8.1782122637703;
        Mon, 22 Jun 2026 03:03:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c81:b0:845:371e:43f6 with SMTP id d2e1a72fcca58-8455077c6bdmr14400544b3a.8.1782122637126;
        Mon, 22 Jun 2026 03:03:57 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7480csm7026590b3a.33.2026.06.22.03.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:03:56 -0700 (PDT)
Message-ID: <9cb74a72-baec-41fc-81da-e3948175870b@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 18:03:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5OSBTYWx0ZWRfX/09kp0xVI+7s
 O1nRGZIxalVZ+3caJVFkC/mVGhxDE/IMngvGXmEVZnoc4xO289q5VptqjFKZs7KAuL6VuuS3c4s
 W8kebRi+MCsiN59U/lOWwDKpAwkJW2rnFIBXUKMBQAGiSXb3YzNvjCeW990ZMy5MA/hHWIO3LGD
 yiP5jGflhL2D3OcFqBtyEqGq2IyQqlrZqLny1aXerW9rjDXynWZx6gIF0IwQBqIKdFgc5D8uDjo
 ripwik0CRHMo0Y4cFuQy1inMs+BDYEot5v1NvPYlaQcJBrROCJA2Uu97mQwVW5kmAAq9jnk4WOs
 rovWi4zVDCR3v+ARrZJ2PMM+lqYhKWPyDhiiBfsYvWzEc4Jx2ZFU3tYS/VRDXBTqVbe9KvSNNEg
 +UjcIFORnm27CGWXGo6q7iSxO22t4qzuTyvtEK7QxSSx2QWKzlJFBonrxxEAVAnN7zJ5zPt65up
 e1uBGLIrCKhPy7v/ZeA==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a39088e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vXOABIWjEGlRoqXTTScA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5OSBTYWx0ZWRfX7MvoM+maMo44
 MmpUCmcTOWerV/CehQ8CdtdmKrnV5tIZtHaOnpYqaX5NpoQKBOtOFUBr3cP1ISYQbjDoWPWKrf9
 kM2COAq06lMclT6fbIHGq7qCE6hTv/g=
X-Proofpoint-ORIG-GUID: 7ElTDUe1OEQbE3UBKcZKYRhyKJ_jPJPt
X-Proofpoint-GUID: 7ElTDUe1OEQbE3UBKcZKYRhyKJ_jPJPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_030400_108376_C9830E30 
X-CRM114-Status: GOOD (  12.63  )
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



On 6/19/2026 2:58 PM, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> Introduce QMI capability negotiation to support both modes. Add a new QMI
> PHY capability flag dynamic_ddr_support which is advertised by firmware to
> indicate it supports dynamic memory mode. When the host detects this
> capability, set the dynamic_mem_support flag in the host capability message
> to signal the host is ready to provide dynamic memory allocation. This
> triggers firmware to send the HOST_DDR memory request and use the
> host-provided address.
> 
> For backward compatibility, if firmware doesn't advertise
> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
> where firmware uses predefined addresses.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

