Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D806606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 02:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v3QjAvDk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqOzEJEw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9nUD2XL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=; b=v3QjAvDkJh0ceh
	je8Klgi50xfkJHz4NdNKS9Uazy+DlJvQQVm/jk/2eb1s6+y8owMjjRVsjHAPM4a43K2ZuCmre4PC6
	Cs/ahlXsrkN4diQpyoDa1R59j+BSo/4JWGABemZRU6qAF6LngdDA6BXNiLlHxhZzSr47BehWugnTZ
	nb9WW0xGtYzbtnHfksIoK0LaAyLSplVgVPczQKu0M5vJz685tlAQ1rsi70/fgieDhT4wID+SeHFmN
	yGYMUjV11hTYZqwypDY2CfXd98aoX5pXs9Szc1IEP7tNyyT8Agp0FOeM4XVlqPxcu7u4ExPyLsB9s
	tP9/xpppoE28Zp/LqetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVg9c-00000005MHx-49xL;
	Tue, 24 Nov 2026 02:21:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVg9a-00000005MHX-05He
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 02:21:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO0EhVK3521532
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 02:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=; b=ZqOzEJEwo6kapjqi
	AVW89+o23xhNlELq9poapFtqYDVYcD2CCnNPFxWBu+EeP9VpG1E52NMbifwnv9bC
	38kJOzoyn8GZ/C67jEpusKMmNHRel2QddAo1mWf4LHTmgYRdXC3Lrs6+b1IZW5nj
	rT02N1Ksq3EWle/S0IoBQVmU2zuXW8kmgigFBfoKHV74m8+mgpYlQNqnBrmZ40lR
	cwS8sDr68oispp6k1FctqnV8JWFCV89RkgDGaLYTPw3F8NjDnGtyk2N4m9yiQBIu
	r9ehwimOfVViUSPQJci6mgxEHVy+GfL9fXMABPC4bYNOD1A/T3GzTDu1jwuQRo87
	6E2dYA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb0baf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 02:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso4445222b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795486864; x=1796091664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=U9nUD2XLMvpSFtPNQ9wplMAQ5FOYe9tVgVB6U/FhV7vpycJPk/Uds50QmPE/2nC6kZ
         QOQHJLShXdP4mS91l8bIbclzAU7s/TQPuQvo0bXYX07HFaol09fu4t6ECscs9bC27Y7M
         ttkg/abAr9+f+YsiaFe0eflkPEh4M6Fkfn1RKIlquLFi6Ato9qmJRWMB37Y+h88VXBkY
         wF7Iu7l8fF+TBT3x3YFsdVG+6zgOlTUmgpE5Cj5BZGKEYCMjegdYtZ8DA8A6p8CuA1KV
         c1vJnuD4Wg0va4QlSWBD/6PlRoa1kSt4TYlwRwDUwYPu3QrGieMBVFW9uOO2Tvnvap+G
         fOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486864; x=1796091664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=V9+jG6wiGPlxvNhScEdI7qcddIL4vynYAhnWIfFoA4JXVx0amC1ubjjXUitfPkLY/h
         MC37lZ0Hb39PJFYqld2BgMmjbz4U9Rnp2EpaQh/2/xlz19mja7XBmTW4KgjjrE90lQmq
         j+zfvhH+Hxkkv/QpQELfKeKRClCCMAPjg/nUutYm7TXZy769GLthbtpULj6Io2gFvoFo
         YHm4rGXz/wMO4g/scu7XaeGk3dZ6UlE/HHH19pZnA2bXKgAkn1DTq24sAm+9aVGfJgpk
         BI8e9VIgqahoQEwWL/02MtBrm/Sf9Ysip0FZdVVvgF8ug4bbyTx7TVIBjTNMJBfJLj6O
         OWKw==
X-Forwarded-Encrypted: i=1; AL+hErGsWn03RA9cLfepdQ1Oc70kCZSsSaV4icespq+JhVNx6l1RwA7HU3oPy3AB1HXuR7Sc77bGWIE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+5+y1bx93qp7h1l++JC/j2WQ34OZqUgdB9xodMu+ZxdbhGWXQk
	gvM8qY2LdJUEj46E7GdVzk2pZP3E28MIhnPWE1olZhY8SKPXe5kNQDTMXooit6c2OHuJXjwHe6+
	IoHcQBnxs6Ussev/1VrGEy356KoTByA48sCp8Ix1/MUgtab30XxLdxJqeL5xKi4Ze
X-Gm-Gg: AZFdTZdGunAmTOoBhh2R8l5nQUde/mXCQ7RvgoQJ1dQ/nQIhqnCu1vGQFxqP8SUMQTd
	x2XIkEHpt4FVFo2xru5v5e+xdvb4EFo5rIXDOHKOiIOxEbxcDUpvDHwjZDAWcPpNif88Gw3PDVr
	IBn11y8nbZqMgOca7jCzLS7DgESJaW05gHhIZSHbHroUxRqNQ8cXNUzwSIEN/kcv3r3YILog2TF
	BmSExdm3m8fYJkDB8u5lZHaT0c5Y6cPY3nVm3ix6uAR60vvy4TQHVWyPVBfoWCuCxSrkm3BMeoo
	rO/1QCk58OwIwlaHQTrTeEqPMN30YNC6mMCbj4ixtRwEUmUWd2EEUGZ0a8xJbGMBbb36u9I6KJc
	wG1HLWSpt/TPF/O+pUftR5ioiDLWmDUYshYocGIr6dAnPDoVbIjYxQ3ONaxdec3Oycpas4nhQmZ
	0i7h76yj0zcdn9gLMs2+UdN0ax1cMYxF30m2mSsklB8ZyK2cU=
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867051637.9.1795486863644;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867032637.9.1795486863257;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm6298892b3a.13.2026.11.23.18.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 18:21:02 -0800 (PST)
Message-ID: <a9863854-187c-43f1-b7c8-580938dc7253@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:20:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b04f490 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=4O2SGWbk0Q8A1cZKks4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: N1nvKsYaG2JidG2MiuUrm-Cvqcf7zBc-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfX9lJmACiqm+n1
 bK9/fzmC7zDElMPiwdMtGUi3bxaN5gm4pENp51pC4c4pK8dNvNYfSQpyah2QAaC7ZE8cvfLg20u
 StUmgU5cmkmfjOrjI/GbckST0Z9av4Q=
X-Proofpoint-GUID: N1nvKsYaG2JidG2MiuUrm-Cvqcf7zBc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfX1pbWY2vymi9o
 VnKinuDVZ72yDXBDBbKEVJDix5uNMhfsXwdnuQRh9uhOlFiFpELxVr4lpMtVYoUZOeLapBBMAKh
 L3KeOwxNf8OLlFCtx7ccXevHNNntBB8Q3PEv2ajqGpzRLW4JKH1YCIEzJQf8qFs/1ynzGhvIzSX
 EH332c9n6PkGGjL/SXJtZeGu2zMfYd+GRId+oA2/9cIpCSEUn7cOz+ZgMRN0giQ9aG/Z4hODevO
 imb7FY1dW2f6hz1sjhT5nnk9ZxjUXW9bjQDESsb0vE4GwViCi0AOcorFAI6gYghBGuuR309nmCb
 iSKvCD1qdjvf7ShtDzhm7RqJsafmkmO19GuNfmEc0zVqssCvUiEs/afVaxG0emB4E+s0Q2GZp+u
 PZOmHaUvsmTO2u5NdoQpRnEIcrDDdPc2BELhNNSOSq9ev9yKK1XFNox/AufKZVv9PnVXQAPpcGp
 zjZuVDThBkY6tOsKAiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_182106_184209_0C5B7D40 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/2026 10:10 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


