Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E90C83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4y93XaW6JaQ9ODvB/R/LVNhQrngjeK+yDygDAvgQbyQ=; b=y9e5PCXOosiLjfKqBdend76VMx
	Xt7wyq8jUMnjmRCIHtfheqoWIuVfJvso0FcnmcL8FJB2RjSp8uC6sIJYqNJdU7TxNWZMfQW/IVJKe
	Et1ea9G+MNcgmqEG1PbD7xAB9GRml1i2/E9l2i1m7MXHgQ0GI95MnpX37SqKj6PdkW2MWaTF9U69x
	NHiYh4OQ3tJgajHafUltIQgW90fnDMuA1VitZPGBzVhJiCz8NXB/XqzdAVRTzXcij8azUDqmrIMCR
	84upMtAMk2rPf5eLt0ndvBqAC3xT4Y506bmscozt873M4vBrYS1tO500rb4tQUOB4ZFM/1sbk6duP
	3N/P6RWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucopz-0000000DDIy-0tgS;
	Fri, 18 Jul 2025 17:25:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucohj-0000000DCW5-3gqU
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 17:17:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGDFDI000572
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y93XaW6JaQ9ODvB/R/LVNhQrngjeK+yDygDAvgQbyQ=; b=FBhSQX8nAJ84PyaH
	Du7Gq9dvJuc5iAoif0gQLyU+gt88MeFLJh3bwxaHlLML0cBruLk0TgfFQInuPEjV
	uciqXuJ70XWrhxitnbsDt6aOQ0kA15hvhktcwv2AU3Pqz7ew8F9Bz029rA4oLj4m
	KLX5ktsUE/hYW3PQelqI1VYmKBgAUMuErxaCSmZ9t3WfOd0j879wq9xsCIrxM2xJ
	byE7fUQ9Ex6D6IwjjzYSWKhW7LZ0UPpif18sbKnOR0ety5jIA4ZCuUqQX+yU1W2D
	W7mjKYoslgFtBiT1KHyePy+T2VK+PZzxPRHeOBaftju9RDwOazaJQ84aDS2+yCu7
	1p9GaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dryeus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 17:17:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31cb5c75e00so1960763a91.0
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 10:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859022; x=1753463822;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y93XaW6JaQ9ODvB/R/LVNhQrngjeK+yDygDAvgQbyQ=;
        b=CkDWxQ4xJPsLgfK1tMBihhbpWetJeLrZ9CquzO3JphXcuc/fPK5fe56LhSJZLlCVN5
         i88qS4WSC1uHQUI0Y3/aY5Fl8e3lHrtTVMO5/Sv/UeKkbI9Zk8fDlIL4lYOVn4fkiIiN
         jBDrOM9rLzbYJISrU7ss1mj75psUtmjISN7y/cLV9/npi8W9R8Ch/E7D7TDX3d/z3GIM
         Z+GNAFlMD9vVYaeDI0gDUPlMNdyiN2cUF2ZyHSHFZNyTjgZGWW+BqLIc1xtTf/vHt0PG
         fwOoPQsJAGDNmNclB4E3+4RBWLJRPbpunvsYa1a09gpqvrlYZbdPV/U7CL1GOdKH/ChT
         iEbA==
X-Forwarded-Encrypted: i=1; AJvYcCXbHDuYwsdQrXr7dONdd1xU7N6NtAW3g/VoqnK4xE/tu94uc9plQ09s4sS+VSyQl9I907/wvpw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQv4tEvNa6Q2w4UBBUAWHBces+aaRRcnaifwTC6owUHz4Y9Oq3
	0cohMTuT6VMQyfl7X/uouvzOgK1wFpmP14o6TNG1bW8mMXop2zROAnOw6PJLM42JUgErlAf0pZD
	elvyLUtYKKACnuQRhQ73ky6y9b69xh9q+9CRGxCQ6iuIQ4LmVoQyVMmvsgLXZcDQ7
X-Gm-Gg: ASbGncvasgRtvRUiW3d3iMImHeyA2JnG9yCwnqbKaFikQnB1HOgv+Uv5p6p+U1+aWuW
	SPGQkq4KhpajNl0LOAfB+QV2jUUEeGUHzKT1HEq8SUKff+eRhC57ol7a63qTt92PoLQTUokbdQR
	qAg2oDBTRMksGip3c0acuuwYe01GgR5pjbvLuKKoyFGCw1W6nG6mhOMYMHl9SW01FxL9vgrLNMo
	1/U6bdKTGPcf43jUAP/wWysyXlk7tpJ6pDNICb+FlopXlZT2gIUx0CSzMvyrdRK2HYer34ABoBI
	FBMcuVLrig77KMrf9nz4f+SuhiY1TdRenucnWdjx75jZlOopI+CnuJ6/snBq3DhsSEcydXidPnr
	65Yt3msMNnq8z56G1OEvZKQqr/7JUU9GT
X-Received: by 2002:a17:90b:3d0a:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-31caeba85c4mr12420016a91.13.1752859020115;
        Fri, 18 Jul 2025 10:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOF+lVUcNSLOiWyxXFXA+cXwuxrUbxYsmwp7LemIwe7xNnYGs2CArSmGnMtoIDzBKVisqbBg==
X-Received: by 2002:a17:90b:3d0a:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-31caeba85c4mr12419920a91.13.1752859019043;
        Fri, 18 Jul 2025 10:16:59 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb7742596sm3040325a91.27.2025.07.18.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:16:58 -0700 (PDT)
Message-ID: <991a3e75-9efd-47a3-9063-a064ca747e9a@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/3] wifi: ath12k: Fix the handling of TX
 packets in Ethernet mode
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-2-nithyanantham.paramasivam@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250718025513.32982-2-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8urKM_D2kkeUm00VnTxQA9bB5ElOwy9Q
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a818f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=CTZ-dOqDz-Vyge5Vj4MA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8urKM_D2kkeUm00VnTxQA9bB5ElOwy9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNiBTYWx0ZWRfX8s1ui7sIkjKe
 /0MakpLPm/LuKy9lNzpKAHrRlwh7JCuTl8/ELVBnzwOBJRkutQCw1ezJ6bhQ3eZC8uZQ/Ni8/Bp
 WQ8nNGMb8q5vL4dRlisYjHMwSa/IwKjQYdCOe+mQhBIl4GpQIu4mDiJbynSD7fao3eQalLujYwM
 ozA0YrVQMbn05DSJ6v44w+m6FaxcjiJAA0Ox5l+uTxKfFK4/6YywU3U0PLM2w0Ws59dRz71SDe4
 moMRZ413MhcE57+14/4BPCTTO1FweLZ954zZTRbZAjJ0U9CTx2PMFs/NmQbCKb9R/jglpNipZJO
 pCHToKolCzQZ04+xwEHGa861wHdejOrTNVqcw9fAi9bNbgM5DTf6CVgOFCb2PHR6J04usTvZIgu
 HKVJmO+0jf0j8RsQmQa0GfzaZ1X7TQ8CKeybWsQYK6Mgu/pUhd0VfriKQaY0kGFIFq+UDkDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_101703_926447_478D2149 
X-CRM114-Status: UNSURE (   8.54  )
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

On 7/17/2025 7:55 PM, Nithyanantham Paramasivam wrote:
...
> +	if ((!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
> +	     !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
> +	     !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
> +	     ieee80211_has_protected(hdr->frame_control)) ||
> +	     is_diff_encap) {

nit: this last term is aligned on the wrong (

i'll fix this in pending, and since I'm touching the patches, i'll go ahead
and change the { 0 } => {} as well

/jeff

