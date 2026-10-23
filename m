Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E5606A319
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 04:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p4r5QT53;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmVNkx5h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRW4wFpy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=; b=p4r5QT53oBh0kt
	7FhUAYkAk9uJlfw62hclRb7jp4EL18LaKzteEEt8FRsIuvGWi0UBNTF9HUA7v2gHuKlDrQaSG9Zq8
	kuqh+T0hzLGu1w2+Mbtp++NHbr8v0uetvVCBE/CT5Z4kTLKA+ofs+7O+KAdD8tQkoYbMVJ3U2i4zn
	zEKU1ZjM8igGVM8giOSQL+MyDDsj9wzNyatfjY/7Hw9b2E7ADVxuW4/I9qKMLERuba6begw+gYfc2
	OGXBqcQ6lkTEKD7ToK1mT+lzDHPpA+8zgJukwESRCeqN7I+YbkyxSuZt8Znn8LyGDIY14zXsxKp4V
	LHFrKJG9wa5+0SER7Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK76h-0000000FUhr-28Ki;
	Fri, 23 Oct 2026 04:42:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK76e-0000000FUhB-2qGg
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 04:42:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FBRZ1792144
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 04:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=; b=bmVNkx5ht5WdX0GO
	kS1R2BbLYVM3oerFlqW5Ikhz74kOpupOXPOXKOB6l/8Rl4NOa6L/vMtYO0p+sUBi
	D039qjgaGaTQ56DSLQE3BRT+0C7/yd7LhC8cfR/ABqUS05JHENnBJpV9AsGOFxxc
	b6T+FqF/EZIu0YPvvDLsPq/SExkfqc+ci/af7ef9Mo/WEhREb4zjhBR1HOGsSI9c
	dc9BFTF6ZobfYMo3KJtv3hdcsb1HzTcvWnYdDiYAXHzMaCjsbmEpdsHT1Rwsm9oW
	Pqi/iC9D1hH2LyNQa5F0MWjIJq+6CSPQQCpioj38OPbSb3LQS6LfHswp4bEbu8/1
	319mMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jexc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 04:42:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e954d87b48so6505145ad.2
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 21:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792730534; x=1793335334; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=;
        b=dRW4wFpyzHFQiuZ25a4oFxPsZ6qyxFz+yDGkU63mZ+X1X1TLf5hKbiqrkMqD+EK0mq
         HYfVPwO0m/qIrPeynMwkZznhqS+9vWmjpj1eWgkEiQuZMzqhQLvK6T6znBJbu/V1+Tdn
         Uz3DVreSuYGBsTeYMHK5Ecxr2N37rHN3336fdzmRi+ujcAuUCWXNteIQN75k3RXBmnsl
         Khv4h+s03KlYSDzhL1DCPlICcw/b75tdVKqvHvb+vkkEPVPQuAvZmzo9YIWhO1XGiLPW
         6Y3tjoicTA0vBbHc1SSlEJqcH8twDNrE30ykf4npQMHf8iZr7Mom/CGAz858t6711or2
         jbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792730534; x=1793335334;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=;
        b=zidfgJuZxzZbH3Xt3U7/PihPG943RnyfTxHwLIpjZLLa/CD1XisXq4ViFtDFv1ER/3
         DOGJfXBz4cb/d+pm5UaXiTSTMpPRALJk8bsc8ol9RUhgQTN/7JhBLFrAJtRp1tk0w+c0
         0LV2MB+MNU1dspTSlYic/cpTZu3rl/F1LMk89aaKdMGwwhUcb8YeGGvMCDornTOkmeq3
         RCGO5f4B+z10SmshK6OnfM146dqeo1r/yn4y7/P936sLh5Q3ftaK4PpSRrnuCm178vuD
         9cOc2YNc6ALHTto6rYEH13gU+dd1ZXH81J7pxLGcPnRvygpyKRRCfKxHfZ4ZjeSWP7Jy
         FP7g==
X-Forwarded-Encrypted: i=1; AKwUvBy3C38BcOnrUtqp29MrcWA6JfPrriji441KqwCcJg1uTEWqqmXgUegLAeLNBu4ixXQTH0o2+Bs=@lists.infradead.org
X-Gm-Message-State: AFq9FYJNtKPqd9QdMZk1RmxotR7pAqBNO+bs5afeON1tS8HTnfQ4deHx
	6Z6DbuoT67b4IkoZjJUXvn4Gi1E6nqQErJqmjvy/VmWMqpjaN0QC+mUg/lCV6FCm265LZrqpICT
	k4fM9xV4VqBotSACoKkIzZk7+xeKm/f8EWOnifZmN90i1ML1H4v/EPnpu1LECgk5u
X-Gm-Gg: AYBFou0KpowSVeTB69eAfsMsLho1PaMRJP1aHr80rzbU4BtBLSAxirQsml5jgCutbUl
	svmAWUVXeLVpASIGJRGj5aULmnivHe0DHq+Gh5d5nkmSpSg+X/ESjUqmVM41AFsBKagBivW0aYA
	sOke7mg9IQZ8Cym40+7gzLqj0nhuppbRgTvZ6/UGG0utzHCC+jUFxGRlPiEHTSjOsCsNEv/nBkA
	wisc2nA4g0Kdn6BhE7aBina8HhzdOdVWDaL/ijMt6K6RVveLOioAhCLTajjPJlel+i8Ru9Sw0YL
	Akp4Udo1+isaZ50fMc04ggpLizovVuTriwk8IWM4jUUImlJsY9BMj0EqIFpAkUaYbXJ6aaEljid
	etlEwnwrhBou+GTEIIZT67j/sdRukM/t2220UZc4sVxozTOFpKJDhBt4SzC1AZB5FRh3+QID/
X-Received: by 2002:a17:903:1b48:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea7cfb86e7mr10901185ad.27.1792730533656;
        Thu, 22 Oct 2026 21:42:13 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea7cfb86e7mr10901065ad.27.1792730533227;
        Thu, 22 Oct 2026 21:42:13 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bad94sm4880885ad.49.2026.10.22.21.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 21:42:12 -0700 (PDT)
Message-ID: <76d4ee42-c8da-485d-9623-6f65a19b0c58@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:42:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
 <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e2HDxx92TA4Z5BHo6agoL5maxtuSRsZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxOCBTYWx0ZWRfXwoHKQdHfLTTd
 5nK+T8Ozd8ORPBJ+MV1UDzRxbmNlmAFfujjqjBYoic5AVX+6mIwPr+W239/ixoMMMuQkYVvxltY
 ArYR7SkHTnl4EUkmbWtVqZeIz7obfxwOZGr2p8eYH40OVxqu+4Y039PN06DPJL9GCvyF+Hx9IT5
 LExlEt10b07C2RYbbx/hQuMOWquvVG4gTyJ2VFLJpTNRt1FtDTXpmrFVQOHQiXOAZli1Xz0YIoJ
 iqLLFS8c01rJ3Upwlzn82ZI9fKNuCnkjPBdsetUaTUX9cBc6n/CfCXPn16H5L9Doe/4saTe6XEk
 hib0MugGseFksm1lEG4+ruqdzhc3glC7nbPHYH188GiZoncT9nSiwAK4aLvhO4Mtg0Fyh9FkP6H
 +Er8Aq82RFqDLOYS6SCgcLaBtqRM9ZnlF6wipx51016YHeXtjAtnUqEqjWFJyiiv4e8xyAdqV7F
 EftAppLA/6A9KH9N5ug==
X-Proofpoint-GUID: e2HDxx92TA4Z5BHo6agoL5maxtuSRsZJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxOCBTYWx0ZWRfXxEmOvHunMvk4
 DHy7/8zuAWZpwyGVulF/MOWwUcTY9duSGI12nkcgunpjLzpR8QKiSSyS37YxFhgD79/41zxpUGa
 4ea0d8B/P3FfgyK0FbeSlWU5bZvOJy4=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adae5a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_214216_861358_0C7DEF96 
X-CRM114-Status: GOOD (  13.99  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 11:44 AM, Shawn Guo wrote:
> + Jeff
> 
> On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/23/2026 10:43 AM, Shawn Guo wrote:
>>> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
>>>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
>>>
>>> [...]
>>>
>>>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
>>>>> the ath tag (working). It lands on:
>>>>>
>>>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
>>>>>
>>>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
>>>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
>>>>> and works.
>>>>
>>>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
>>>
>>> Thanks for confirming!
>>>
>>>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
>>>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
>>>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
>>>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
>>>>
>>>> maybe I should submit a patch mandate this rule.
>>>
>>> I'm more concerned about how we would fix the regression for 7.3.x stable
>>> kernel.
>>
>> we can try to ask stable team to backport 15f7603b69a8 ?
> 
> Ok, I can do the backport after the commit lands mainline, assuming it's
> part of Jeff's PR for 7.4 merge window.
> 
> Shawn

Thank you Shawn!


