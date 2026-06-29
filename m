Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75152C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/WcKCXSif0OmavnvlrDGhjnNI9xe5H6vxO7cV3gu4A=; b=HwwMq9mGWs4O1fnmog9D6Ngend
	Kbe3dBsEpO1jReWuFptOJe7x37hsppssl6TWSSyzWWS6/B+l4IVapHZUSCI80XI7R2Kpn1fJwZdb2
	Lk8jPF48TtRkbT4xNfZcs99WxF/dhCWm+zrxpttzxoYrxrR4d18tSEYX+WyzpzU02D8dWw3NLTGH+
	JJlj1g+ZQt/p8/fmTVjuRgA70/fuzHIRV9s/BE34jqA2auq4Gy67r8rPe3C/c+UUDdHel/aINmqQ7
	ohXTSG4H68cBcX6E0Vm1HTZ8yiU5E39CSWVYkIhCQkZesWaFGe7/iYoJMmb9JKq4dzSNQmJPZ5Fv3
	zc2t72/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Xm-0000000DZh8-0wnd;
	Mon, 29 Jun 2026 02:16:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Xj-0000000DZgp-3pKv
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:16:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SNkVGS1183634
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/WcKCXSif0OmavnvlrDGhjnNI9xe5H6vxO7cV3gu4A=; b=Zs3nrd9IjV/iScr4
	QJLf3b0PLmjGf9zDehBWydfbMe1o2+jnQkg01Vr1M1zvfTjdLDEtx2BpT41hhrZd
	EZ0may/RrL9MbCKQt7as8PMFt0K1/IWBrqJsNsaF/JGN13cZ9fqH1oJ2NRlbhY1p
	NlGOkQl8L/2xHRi8mY6Jf6YEn4Bw65OJErGkKXiCD5GYzNRELMvqKBcc7ZEwNmuQ
	KowN6/apOLOp8y7P1u0YdfW8D6nWT1dtRBNZrUG7+XXlW2jV8lC4fLoqW+9eC4py
	ZaaKAjeXlKKeYVwcZLbcjvqTxxK79dbVqDCaLe1/KmPQpfgC1HyU8/+4ZSxdnfz+
	rBjAcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8m4w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:16:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3465192a12.2
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782699374; x=1783304174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/WcKCXSif0OmavnvlrDGhjnNI9xe5H6vxO7cV3gu4A=;
        b=fBAvCcKS+5b9lViV64Y1qNkH/ea4ufDPldJtvXyo4IZFk7JJuFudKhMSRH/DiwTIEe
         11ydHZUuqCYmeE/u8+XZVOqptJDbFvBOE+/8ik1eYUDjWvVm4T5jmsAv/RsdZMGIMp9S
         Re4te4x8K44P4Kex0pNOYGPklxqTZMirjgl4cV932cFwM2zO56dL4lbmuYsf68Sb66kY
         8AwwFrEtydw4as18lflIrn/XOnbmr9jg0rsTuRUIEcQlJpSwe/eYylOgivB8MCPN/8X9
         XErlVNPVstdX8fpfXlVpm4B4vlxIALDDttlYbozqkpKwuCtrKfyif+FDx00GTiLfO72T
         rj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782699374; x=1783304174;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/WcKCXSif0OmavnvlrDGhjnNI9xe5H6vxO7cV3gu4A=;
        b=opdsMiraEB4HWftGoT49OGifYAZoVCJMYk8RtDg+BO/pw5iUiW/xR1AOAbJFGNYswy
         z4RpuuJwoDirzaddX2nvtBMx0WvvpFJ1sTM2xdKGQ4mtRvr4yNGCoe+7TmwFcVwBiJQN
         xVfZY6Z/LmhOX/a7QdysNmpkmITc9oizFg0RFwDsjL9goGUZCg/FDGOGNbDm6jrIgyg0
         T0pJ74XHIsxKjCr86Kr+M2IgS54YitSJRSEk5EMuz7sKJFVXI0JjOuxKdCxflRaUvyhL
         MIUFazQeUZnrpg8ViCbw/nacml00kiql19sN54+ToPdQumnNNnG4ANQDGFGFV6Exhvkc
         WLsw==
X-Forwarded-Encrypted: i=1; AHgh+RqXDdNL4U7CTAUvgafFa73vqZBe7b1Ma0m6zkdRkIkfPUc9GpmappcrVIW9M3CDx036Ee6WylU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8b1V89ksULN+Do+Ot36QZIqYxje/TMIM9raOQyIUc+3YeIPGv
	7vuJ+Bf5jhKycox9O3VaHtcz252XMY5ChJeh3HjuEVWGeHTUzo2jW6Zh83ygDoO794Piga8mQ5n
	Mq/slFOeqLe+Gug+iCHzEQ2QZLoQKykaeuBQXCi+KQYI8EdMeIDSE17Y/XDfNxdIFPgSB4IAeqb
	A=
X-Gm-Gg: AfdE7cnoJa0O5XndGYXfcKcXxjYstQ3YFLdld+ca5zN53EZTUoFYSE6xAD7X31iLjBj
	3LqobnJiweQB+x0+H5HQ5vAwiHHQp+NHQCBmCe6W/e2V6XqsD3vtUhxJm41MKiO2zgPq3xrx6xx
	WMrjZiwBwYZMvfeSUH4FxsbniVgbZaTxafDeYnfK5zTTbmGeJWLj6Txmhgi4tngLpdEC6YSgkf6
	VLFqRmcW9LHTuQRlNMMpSt5W3pACBJR8wKuooCtovHp6VnyDhsUSdq/tLuhJ5MEKWum/bdRJZmF
	IsmKLwD1Pn8O6fVBYJIu9OoXB/AUi9v8y6Qo0KhglcrJbBzAWG3kG5JOGF25bWoXkiQBd0R6zao
	qYS9UKFW/CDCxJlifJcYYADEP66RigCyC1Ck6ejRscgwUyvTVMhsSlAG4xPIKtcsiSY4iZLkOZI
	Yf2D4R3g==
X-Received: by 2002:a17:903:298e:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2c997a892a2mr66008925ad.46.1782699373901;
        Sun, 28 Jun 2026 19:16:13 -0700 (PDT)
X-Received: by 2002:a17:903:298e:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2c997a892a2mr66008755ad.46.1782699373433;
        Sun, 28 Jun 2026 19:16:13 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac7c9asm82317545ad.4.2026.06.28.19.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:16:13 -0700 (PDT)
Message-ID: <f265457d-a876-4e5d-8cac-25b5fe2180d0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:16:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNyBTYWx0ZWRfX3UyoqD/ZdqQ/
 x+Zm+9+HPh2pUpfSCy6fqU1RW3AzgsGQ9iGMBjuvofnH2cz2taw7x1E/fCRSUHOFv4GppiOSOVc
 kdht65+jzcvu52xMI4fe2lif6M5bIvo=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41d56e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7Sa7iVnaTNRCtE9djW8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: oQIwjaF-1y_WWiuHuqsU--IgagWqMeaP
X-Proofpoint-ORIG-GUID: oQIwjaF-1y_WWiuHuqsU--IgagWqMeaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNyBTYWx0ZWRfX1/5Tcdl7B69R
 2azrwtKbq+u4kLacqFkUVLFgPJM++bqZEqvikvs6FxpK9+lD6EwqJzVlJL5NxHpSrgIewWk7HBj
 RBOasl8Is729695yQ0dV3g0cb3AnB0k8a9d3JMysbEsqRhqwzj0lsy1wFZNhJ9SgRuiQnGoIL7v
 EKAP3sCMOBOtJbxYb9YVeP31hbh9QqA7TFEOW5rGVBxUUaPgF3lGq5j3QBkLqFYTuMelWDwDg9M
 SoJtbn+xifp9V1TDzO+LWZ9sLvZfmaIVD0x8CjL8rgCYjFJH2OjY9gLm5Lkfu3XCygkucbq/cfI
 /6yBP569FWFZ14ccR6Qj2cc/a9an49hbeMgP42AY1SGOwhDoI7jIFZIdnCXfjBIHHhvaSKJpzLw
 so15rquCKS53cOk8mCXUq4aBRIIn8CKzu/q85bsceJoNlChvpYlK/2kFxROgreXbpFzv+rpmcm+
 Y+joVrt+tW+qb+LSdHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_191616_143657_FE664FC6 
X-CRM114-Status: UNSURE (   9.30  )
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



On 6/10/2026 11:13 AM, Yingying Tang wrote:
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


