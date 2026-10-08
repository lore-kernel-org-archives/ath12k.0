Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE06CA600D
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=; b=s6SVXQy1mD5S+Q9Ify2PjtvXDA
	YyodNTfGvP5iYPJ36D4KEhXtNGzTcqQi9/4yc896v1XfTLUKyo5aCwqop2sPLIzK7NzQm7VkVpgkw
	bJGmJErIrPpIDbE7dX5A6LIr7HuTcmRGi0WjfmWsIUAAU7/MOZGAG5HyYponGJm7UlKzbobKo9efq
	WPyu7AL/KCCGEXkyarmQJewWHa9s0HEk1zcRuAEyV2NkSsKglAdXpJ2fJhVc+78I6f0+V/GggdYTf
	1iwBtRnHhJH3zPnV1ac6I3jc+h3hBQqH8gywPxvIFu0tUxtdSxfFqG1odImDoR1V5LmQ+vRFrfHGy
	K3LR0lfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErx3-00000004mjh-1CXx;
	Thu, 08 Oct 2026 17:30:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErx1-00000004mjP-1Y2S
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 17:30:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVYGo070556
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 17:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=; b=RPgbO7v03FDFpiVh
	MWLdcPcflpO2sXv0TY9cH59v6+SDFow+DAdbcIiFtU6j/ZgbgbDI0Qw9Hd/jpto7
	NVguRyO8M/y821gwl0LCYFue9TjTVRAkdON+BPoEJiLkTornUhBS9MNfufCqNWih
	UKDHs1wdcx30Dm4xm3yfBj8y0tH2xYrY73motGBjx9MOTi/mDkz1mqBoW9OUBpsv
	zg8iXqn0cI+ZZ1A3eidZNdIyWRE4hEI58JxY+RsaF6o/+rfOyL9Yj8bCrpzqYEu6
	6aXDLS4MXLaR9awwdU4byVnfxV1VWaHDt+E4LhsAQlZQ8JI4gcs2vh27bXhzJxxY
	OrPQbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgbk2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 17:30:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10550750eec.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480638; x=1792085438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=;
        b=FmRjuaIifh/YpnOYDv2hqxZl4Tt7dn19zE5xljVe+7KGm7T7RcMgmjAu/AM9lAzg69
         fORw5B45dZtkBP65rVu48k7WopknPT/aeEOB1ViVMCuklq7aYfr5lK1jKbzfKcyunhxn
         Y5uMEob4pz0av59lKzsm37HT16e5RITCzG1og+3a9a8cYPqk+bvCvCX3N62wuhEPs1S/
         JBsKp1OGnzSXYwxAKuQ8JTtBRwtwmYXYREhxTw77Y8Dfaoj1iJYscXVY1a4wUBZlGXwE
         6yRoXpLmjMK4F/cq9NXgpkb6AM3AlSrBq7JpBW/A6m3KJF0j6vCEvnMvY5ZvW4SGdFD6
         Dygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480638; x=1792085438;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=;
        b=UYp3G+i8pa9x23m2xwb7vfwxXFbnBn1HlxMt64GYy5p3WVZwsawaOdwmbU8S0iJM5L
         tPmOG2FCL8QEdtWJfp6z04fE+IUJd8p/ace1zN8ISUHu9KdV4DIt+Vo+8CsiHGn7p7+J
         4nCVNv4PyT2lBgpvWF5gUnPHJqKoVOipjiYG9K5kLUjiUZdCqLRsTO6kxxBxhWgfN09Y
         FMgpNjrcJeUAHlyGdgY3kiGW48sVDOI4oEtBqr5owU4kNCI8tam9a67HAUXl/3K8agZB
         0lsgB9eScmqn8h+BcwIoi62GXqV4C4uLydcOqngs+QQodcJ9Y+iICVjt6w00vV6n+Txs
         q7Ow==
X-Forwarded-Encrypted: i=1; AKwUvBz82qTXYdqJPhDxFgCCTWcVwBur6XS+R1LmkuRnuiCqNTrpPTDcRYCJUyVpXx/YZF22CSvaPiE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPY8mbKq8neFdw6lso6S5bzBtYji+qAYDHBabWb8rL0komBG+O
	WsdQ26ns7q+PqG/OpYaPyfiEs5ewEFS4LYNr8WPZu5knB8ntF4S+JPNFtNDq/3JWgsJcw9yzt56
	IKizWhFKxfEVW8/VZqJDona8OsaL33Pq/kRi/mVVGuUPol//4fxK/GFcbKqlISQsB
X-Gm-Gg: AYBFou0l4k97hoOoEtnRhFwQWrv3IqTw8T018BrVslAKvQHSiC2hPEg8AQ7UicqlEPM
	dENlsbgL8lZam7rlED+f53rbTGPInL2UpDnmeWQZcthGhBVDulJuMg02JoQN8sprbF27jvSG50/
	tyMBx4GhwMO00T7Mjvqadoxl4gdrBUb26j44XclzDfMnhtFzTEA3cDNVuqN4rmayRSIV/dkfXxp
	ORaHmFGF3Go0blVZi8Yii22BWq9BfDonUtMR9O0sAjhlSdQ6Au5cs6/RSaHtCGZQRj0oJ1KlvNE
	DTUp2UCINc9ti50w3d7LWZhr5ILDzljcstAbk+CPeTazbDGRNjY1A80u396E9QK6G8CqV4Nyebt
	CLAN0vGwD0gP5MEzam7BnNMoHaFhHbjxpjhw4UwFRS9s=
X-Received: by 2002:a05:693c:6088:b0:315:afc1:72db with SMTP id 5a478bee46e88-3515dd32f70mr7367068eec.9.1791480637862;
        Thu, 08 Oct 2026 10:30:37 -0700 (PDT)
X-Received: by 2002:a05:693c:6088:b0:315:afc1:72db with SMTP id 5a478bee46e88-3515dd32f70mr7366162eec.9.1791480621711;
        Thu, 08 Oct 2026 10:30:21 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afab2c5sm16076109eec.21.2026.10.08.10.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 10:30:21 -0700 (PDT)
Message-ID: <6454da30-157a-40c5-b1e5-d4ff0bfaed55@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 23:00:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5MaTLCY4KmUAIkW-LPFnDPjDONrABUeN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX3EgR+3w0CkyM
 jLizKeXhQqB1dYVqVgTHPiKG61x7SbmsQb4/wIlaAnU4RZyl8IfHX7GOFTZ3+IeUMFFx0qygfwP
 VaU3fGtm3C9w4dnyOl7Wb+erVPbdJnk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX+hi6aXaOOkfy
 BOCSzYlvIVhZdR68Jfi4aH4CfzoAgCTdPWzs1pwCUk8obdVkPyQpoD7hG+XgoPswMCTIJx/Us6z
 RFH3HBbyZAFeu/kmh3hQc+tiSatdkMECaa8s4xzgchZX3c+HcdBW/w0v4VPUC2/li4OXmXWEJND
 17f8YmJ/i7hQgJj/1dGSpvmHJyImpAO2LEcBfW79+bN2UYkAsAMmi6JToJLm4FN6R6FcJ/mGNrZ
 V5PKn5AeMBPo/vF8vIg8+/bUfxE/Td/4p1JCgII39BFuSckZGUn9rr8pjZda2DISO06WZpo1xEo
 wo/OaOYRdEP0G+N7kTFHt0wVQHDsY1i2weZmpvQZQlgXu+9Za2+OmXk6q/sR9LdnplvR1Y+acF8
 J10cX26EO0N6Km+EPamTmWFkPcTc7b2RS0l4VkrhLBhDaMSjr64EkAs8nxrpfGjcnzO9G7w7PHH
 i1w0A0jVlaL6Av9I2QA==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7d33e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S2GIDFmybDkgDShTZ0oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 5MaTLCY4KmUAIkW-LPFnDPjDONrABUeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_103039_439388_68E8999D 
X-CRM114-Status: UNSURE (   7.14  )
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

On 4/14/2026 5:28 AM, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


