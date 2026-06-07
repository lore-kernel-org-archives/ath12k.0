Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC33CD8C88
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctq/1w4DUNTGPmu45gjf8nQfOPRThFzezJAvYr6KElE=; b=k1rJSiM53oUPmZc+aX3p5xXsRZ
	Cc1UdSs+6aE0jXZrAobuKzXwpnbSrKD3pDY2uZg/ht1ArdZJflD11cR8YUmVU+LPW/rxHBLM6h+8l
	NtcIi/mAVnqVPdOmpY9dT4ubEFxLXTsEGpQKuufIJgK+16lVRl0r1canmzxwm8YqNibuppWzRIU3l
	3JitKAuwTFaAp3bn87Zo7hfDm4c+Q8UoHG4nKBiiXAVucYAYY8siYp2mTreV88WVYkdeQvAryUq79
	pBMuaWv+w16B9V3C2lDu97qvZ6N9AmmtJhPaoI6FLesxmaVPxvpvtgJVaendci3NfDA+MLc14gnyt
	L9gaJyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWFVd-00000002JgO-0qcm;
	Sun, 07 Jun 2026 15:33:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWFVa-00000002Jfy-2bOj
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 15:33:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjZU4440015
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 15:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctq/1w4DUNTGPmu45gjf8nQfOPRThFzezJAvYr6KElE=; b=VK1hobsv1CWC5LvQ
	JzW2rjpq8tTKS8T4rsxpyIdLGG+F99jp1RCRXGQMygI3N8b7sUKLnLtq8unMdiFN
	ErxpOu14veKQU5jsKeg81Eeym9TEgiY9EigFTzAS/p5z3Tc8v/e0A2wx90OfiY3t
	bfZdwUpqf7A3RdgyVBbEx9lAswnjRIYHPKJYzHAfCUUnpkaQSAWJt6ds9EIYUAlj
	ucW15yus2+aX9Ib2jJhPE2vA7R+Y3btIYbzT1HaiRhPrT7OucTQrLyENjNjnaA5U
	eW0Npki4zXNv4Pglx61YrGiuKi8ZAF+y0Xuw2yub1OrP6p7P9/kd0QpUESZcVAs2
	Iea9Wg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cvn74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 15:33:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1365060ac82so2734040c88.1
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780846433; x=1781451233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctq/1w4DUNTGPmu45gjf8nQfOPRThFzezJAvYr6KElE=;
        b=gfADmwe3e/9M/qJxSU84FmzcHFJ5G+PYUzU4vzyUCiZUx3DDposcwVtxP22IJh2wCI
         XdxUHRrXAeTQ6lDc7Ne2P1HMMSKjrBq4CfpCH9USKwy1e9L0FKfUFPIqNqP/bDlhPyha
         gz1rj6we2aGuyqxJh64eG2IHQlZXTpp2b7oBQE7HAuaiAWcvCYl2UC4LkD3EREwVywFJ
         mOo6FjVOYDSIeyXtaw4Vm2b+oiESXedy6vyQJ/35xLs0mkdsA6wx98KT1pb9UoT0aHLv
         iRKWj7zRYC88K1GTO0RwiN6/pLJFsdR9aewoZzGsBYk5AbJiLeAwFrx5DDWbkLJdADcC
         RxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780846433; x=1781451233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctq/1w4DUNTGPmu45gjf8nQfOPRThFzezJAvYr6KElE=;
        b=RMyfBbxdL2erGnJ+ARWWMcGoJKfdyJy9PU+TXQ48lAPvUcO7kGv2OYQ0sAZ2LGDSQy
         /gW6Y0es496cZj0drraLBSnAE9lZosT1HeW3swvoF2GE1ZS8Cjc7qfL6lY+SOA2s/Nxa
         rRP+0LvoaydPR+fudFDQZhlLiAagPytcRBNwjD9tQMmQxO4TrKcbZ8/zEdoTprrK6mli
         41nPE6xXX1YRZGdnL9wEK5l7jBKa+R6c0aXrVaI0GPs7MrD5+y18An5VbRs70md7iNuS
         d8yJhYZAzvhK2NY6q1aVOvAvfjEEwiksD6NHrXTup/XwvXjCHq+NuNB2aTTA2Ax40ocT
         KqOg==
X-Forwarded-Encrypted: i=1; AFNElJ8luzr/toIsVD6y3HYT0CH92BXNn4ofc5PJ41GlLwU8qthLnpHda4Kt3wkw65kfdbuzIEexbls=@lists.infradead.org
X-Gm-Message-State: AOJu0YziQ396K/0Bmokbcrh36L8uGUJ/XVr8U0PmG6i3AC083EMuBP6z
	+NKc2AIgaB4/q0BuPBKDu618jkhetELkxHXHhBhVPYzDe1oIm81EikRBbAiAJKZSurXdh0vgG0x
	yBzfWKa3W2Cnud7sbZWK2jggCpDRZN2IXyYtDRUjyvDwjcSTICbYXEvkBjKbHrblgo+lFxxwU
X-Gm-Gg: Acq92OE5ELXYgmnidVM7QYJhjW/Rxt6C0PO/Zd0ZFh4pb4TLYqRWNgqW/1belAig2L8
	DpbUWaDFz4I2RoHjbqDtQh4YGjoInhvP2RIo2p7LKVf6LO3QXAoJOCK+XanabGwmuv6YRTlsQRX
	AtVUyqkRJgHhJDjXJaIfPsF+CAunslgOOoFXR4LTmUlxwQXFvufmc3NZKa3bhpcvySHDk3n7BN+
	CDdtcgXU1aC1dciKrm5dYZI16SgWZOLib0XXnU6Uk5t8QLZhhrmTE1ZCTIDOSwhlCKLfctx8cea
	wxrhjfB+INJ9oEqBAm36wlJXcE3px6PkIdV/9FZvulKLZAd7qiE2p5VE+oqDEGeo9FBizbW8EMY
	Uf6fh4duEMxpdUaX46q0sAd+Yq8JnzLCAx9mVChiMLFgWMpOvFW9SEl/XoASuCxeu4Zb+L0/WIH
	bwEWYwjwV3e3qO76TV2LS5IHGu
X-Received: by 2002:a05:7022:b9c:b0:135:40b2:ede0 with SMTP id a92af1059eb24-13807d358e0mr5286691c88.6.1780846432968;
        Sun, 07 Jun 2026 08:33:52 -0700 (PDT)
X-Received: by 2002:a05:7022:b9c:b0:135:40b2:ede0 with SMTP id a92af1059eb24-13807d358e0mr5286675c88.6.1780846432450;
        Sun, 07 Jun 2026 08:33:52 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm6237066c88.13.2026.06.07.08.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 08:33:51 -0700 (PDT)
Message-ID: <a97dac59-a689-4b9d-8419-2b09c1d106ab@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 08:33:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/6] wifi: ath12k: Add support for 4-address mode
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
 <20260525110942.2890212-3-tamizh.raja@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260525110942.2890212-3-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE1NSBTYWx0ZWRfX7d2rmqLlV0gI
 5ah/6lKLbIyBSZXhLAhvG0oloXejgA8CFZi/NC8MJe0hyBU7KRV7sKnouaVPcDvaXZY71BpCXu2
 oG6Od+NmqM7pXka0iBEv7zuCZCKSWHYiETzRJhfdLQJTQsjUfNFFTBImeJ7o+5edcYzIeVJcepD
 cvScGbtIzrxhDOJXYoNMk6jdvzIRAGfLTk2ynpby8FSLyC4VN/XCM0gO4rSokkVVmTI8OBSgeq3
 AOvYO1sJte+iQnjbQy0eulqOyza0f9EmRzIgDO4ZLbJkuuyi8mSz6GwmVOSja48BB1U3OaGrifV
 CCdMuykA5ivZBMtzpINEXkGqVVQ/QppPnkF3W48ai9YhvOlBqBZUMYNOv0PTTLnI38/CK0+H2Os
 cAbwWPwj0C+A6Vnrm7WyauHgoA8Hd8hl0dcUCLNl6MBo0WgyILcA2Q/WseJeLxmOxwnIzw4QWR8
 YtW5LiB2iiltR3q8l4A==
X-Proofpoint-ORIG-GUID: pmTMPwdGzfRaCuL2ux8mG9D21nm0rNX7
X-Proofpoint-GUID: pmTMPwdGzfRaCuL2ux8mG9D21nm0rNX7
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a258f61 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=AogDqfkJi6Jrrm46B_8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_083354_691355_11B14321 
X-CRM114-Status: UNSURE (   9.22  )
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

On 5/25/2026 4:09 AM, Tamizh Chelvam Raja wrote:
...
> @@ -999,6 +1007,11 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
>  			skb_cb->vif = vif;
>  			skb_cb->ar = tmp_ar;
>  
> +			if (ahsta && ahsta->enable_4addr)
> +				arsta = rcu_dereference(ahsta->link[link_id]);
> +			else
> +				arsta = NULL;
> +
Tamizh, please check the smatch warning at:
https://lore.kernel.org/oe-kbuild/202606051125.XaYVDQZf-lkp@intel.com/

This looks legitimate since there is a path where link_id can be 15, exceeding
the ahsta->link[] array.

/jeff

