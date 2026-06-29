Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415A6C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 05:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcVcWrR7aCa6ySMOiP3L3rwW/JeO8RSSIPVmJG7s168=; b=VCY05F/oqoaNIQJ7WlzwAGYwUt
	69+VhShSH8k3MR/kch4s+WUzBjUtwpYntAUK5pQCtHWXJTEj6QaMcEvGtDs2gN+Bg/ZGOwF4OjzHZ
	mlPTyvbeVLF3rGG3LcVx8vX/YMm+OOU/lIlVO87KEGol7X8v6K9w2dQqG6Zj1aAIJqDs7PZA6PNxG
	+iukmg+C52zAi+Zit7d2y63RnYt09XQ9G/2UwKO4yP9K7/23yBPIIKDyNMJstMWB8i/vUgXe6kqvJ
	KVV7bkh6EWT+UphjMQqx6JTecCd6I2weqfzsc01p8rkCC2gWjXbptERgk3v7ErEg29lGUnKPzVdFi
	2ssqX2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4jy-0000000Dicf-45cd;
	Mon, 29 Jun 2026 05:41:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4ju-0000000DicD-3ddJ
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 05:41:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJ6u1780974
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcVcWrR7aCa6ySMOiP3L3rwW/JeO8RSSIPVmJG7s168=; b=cBvODaEcl8ByUyZK
	cccmrxzXTHNJ8xyWgoG0UAUamnc/xP8gUyXASQ47CRiP/MtygmDStGXBsBsuuFxc
	9qQM/9a/EY2Yyp2hGqNz5RLnKbQWMcZ4r/aEjtxVQvC17LCvHZ1ytqcFUhWNqd3E
	edLKZTRL2k9FSuNlIjvnRvbsHsWuwFSOx3i+XKrvR6y+mcQTWLesnCVThvSBD38X
	8jL4bETscHcDLDDkb20CkoJdbS2iS9bDxCcJKWEpx558mjcPGY5vuOMw0grI6h9Z
	oqCl1S5pgRaWbXadcai2c7bu3GbC65n2kUh03HY4F/bole3uYmOBqKvy7dazl5vJ
	uq4k/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u74rx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:41:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0a27ad86so6895693eec.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711661; x=1783316461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IcVcWrR7aCa6ySMOiP3L3rwW/JeO8RSSIPVmJG7s168=;
        b=a0ggKH88eV0cDrSQioofw4XWvL6ifK3py6gKIq4Q1ulo0mp/adVIJz2sY7p08UVtiD
         DRCS9ZxoiotEzNWZ0kY8gzN6yjnw2LFcxFWjLKM8OSmHmHMGq+8dkuVdHPJumQGfRWkO
         lg1ZhLJLtalX4Cs0xpzWvjjakmBE1SAooP3/C7vfuan6yR7n1+XZGS4XZQIodO6AOd1w
         xCneuQtrkUo3cLlGGWBzJrewE/57+0YzgI+zx7FnXrjTDDG/ImopJmsCbwLAFThsQHC2
         3hkBz8/OGMHz19wXrxd0rzcR1saFpKXHqyMqpYjj0T0GCOZVVk45XMTadepgHK6w8/MU
         jgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711661; x=1783316461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcVcWrR7aCa6ySMOiP3L3rwW/JeO8RSSIPVmJG7s168=;
        b=X85934nB316y2Nl3SAdOaXJC6AEtEWBZWQoILET/GRf30NE8P0pKcr57KS6rI6ZnES
         Ez9Jz8oqMMWyNGyEY2mFi/Is2XKSZFhJAcmFL8ooWMg3sk7A+YiWVTkGhsY0/MwsXarq
         9UGvlaot7/qKM8jOex8HLVfoqpN7FAUKDtnlj3saZq+fWfqrtbotc4/nOxIoWrN0M1wG
         M82OyJqml8slZ8TSFcGvQa9reW+RV3/96mbtq4Jq2C0pHvwBfi/yvMbQDcbRMnO8zSnt
         4EthKuSXdbVn0Dx+H/l7knWlXMUyhitk7tuG+cxXk1/I4vFF8te0M5uC6G+qSGRf3eGX
         FZ7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoHBrbkts4Sjl76yPH2trqT+yL/fGFmdaSttKoNpAOULpHgN2D0T6q/v8hCKcUtN43fl81wgQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlujMwLe9EkBVUt5JFH/C+M8r8d7ZTYWVS0PjwOmEDyZX3qfsv
	/HoQbnAAjSB6VxbudrWq+VUTiCPF3jKyb0+YujMMFQpPnuFYpCzGlUsZkKJTPXEOMimLKUFQwxs
	WAyEZGFoHqTOz3+3Ga71El+wvlBe+5lj/lBcT/msyXZ3Ib6RQPdFJqK7bPibGgTL7
X-Gm-Gg: AfdE7ckFkHFuAJPY63gVvPKBcaDM67E85lLZDv1BnEw5fVobN/BUHzT+lfOrj05tbXr
	fGtK8G7+3X4NQ9eABGL7CqVmx/wpQihWsZALZ2RCPuD+asr9+/qMDmjPd8uHAe8FGrnQSKn+4ya
	fiYKeL7DWrc7IPZ/8/78DM2a/r317U03YrFPyGIcxCPNEFxRsHwY5fmxNEnFkTQzqjQ+HkkycPv
	xlXgZ8WY5XlvbDRb/MOj51QyEqkqn+ENnA2VmKSE84jRjVrLL5gWjh50NYLAEH5uZ/j2p7u6bI3
	GqswLYXwd9KrCrT97z8Iy1I5aylDpwxYWoKYOuTmDzM7n6wGldfPXICBORf4SxEcpG5vPyq74yG
	DWqGoUczAkXSE3zro3tB76I8i3rzodXXlKEa1wvCxeru9WhVXj+Y=
X-Received: by 2002:a05:7301:60c:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30c84e05682mr14141795eec.10.1782711660579;
        Sun, 28 Jun 2026 22:41:00 -0700 (PDT)
X-Received: by 2002:a05:7301:60c:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30c84e05682mr14141779eec.10.1782711659999;
        Sun, 28 Jun 2026 22:40:59 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm44306860eec.4.2026.06.28.22.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:40:59 -0700 (PDT)
Message-ID: <50459ea6-e23a-4ab8-8409-6ddb3430f5ab@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:10:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfX8qHDAerHNdek
 vwXSlZxiUPOgHtbjBUlGFdbxwz2+irNCv/uvbzFVhE2qZRZpEmirE1RIPefyB46RTADxDG2xJ7a
 Puh9xiCKP9O2aPidd5ww4G1jmqa2HeU=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a42056d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=w9BFTkqvzr3O3xFJ_nYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jmjP19W8i3SSsE0NhVWMVgjTipz1rpeO
X-Proofpoint-ORIG-GUID: jmjP19W8i3SSsE0NhVWMVgjTipz1rpeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfX7j7Zb0CEpCI2
 FEUC4G+EiK7HaP5LhFgz7Lw9k8GSv3tYHh8KVsRfd2rg0puZoutA5/Hhd/WFOZRd1A0HnlVrbw3
 D3WYTbVjl8zrQVR2aRUGOf7eW95Mm/7dWsQSvov5TjJBxLUMK7Iw5wZvF5EMTOVBLNFT/KHWK5Y
 78Y14P6KdKTdy7maxD92vT0VfZaEKhD4tCBCw4XI+NF1oZM55zmOV81alR/BIlANmE6bbHB34qp
 Op2evG3I/8A1JQLF5v3hdDIkLOOsHrrGrlRH0iwVbh/Vyn6ll2+NlOPfctn2aHJ/Oo7yMCrP/ex
 SpQteLBIbgpz6QxYnZa2QUXi/GAaoz60VZgwxhPvcnndEh0QLJBNct5VtxOR49qceW1WXHdTPuo
 z2IF2SyB/qgQE0v0fux6Qhi4AibrgfSLT/ZJEjTpJjOtqdsjFTqOHPZ+bu9vL3h867JTV8qgQq9
 O43QtxlaxacQ0pMucMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_224104_575425_45B33E8B 
X-CRM114-Status: GOOD (  15.89  )
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

On 6/10/2026 8:43 AM, Yingying Tang wrote:
> For WCN7850, MAC buffer ring size is updated to 2048 in
> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> to increase peak throughput.
> 
> But during the RX process, a phenomenon can still be observed where
> the throughput drops by about 30% from its peak value and then recovers,
> and this behavior repeats during RX.
> 
> After increasing MAC buffer ring size to 4096, the data rate drop has
> gone.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..6596089d4168 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -205,7 +205,7 @@ struct ath12k_pdev_dp {
>   #define DP_REO_CMD_RING_SIZE		256
>   #define DP_REO_STATUS_RING_SIZE		2048
>   #define DP_RXDMA_BUF_RING_SIZE		4096
> -#define DP_RX_MAC_BUF_RING_SIZE		2048
> +#define DP_RX_MAC_BUF_RING_SIZE		4096
>   #define DP_RXDMA_REFILL_RING_SIZE	2048
>   #define DP_RXDMA_ERR_DST_RING_SIZE	1024
>   #define DP_RXDMA_MON_STATUS_RING_SIZE	1024

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

