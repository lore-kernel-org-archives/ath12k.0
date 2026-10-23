Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D84606A31B
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 01:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QnthUqNX;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAIVzq3Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5mnGmgt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=; b=QnthUqNXqS4P+d
	dBxCOH1gbQhjosZAJ3xhDR4LLbAxYMz+iKmvyxYncfL6w6j67J+XF5U2ztOSVkqXvKpcATgkjnnu+
	Sgj+oCpzgoVkrWRtOZqOOXdiWfOM81yzsvTdalJO4RmyqKuZctO0/BLtGBaK8B/+eDZWXuiPAC+B7
	IbVZ21H2bbKtWtcdxFh1SJGVfXu56zYv9Cojy84mjU9TkpXyWsWKx2bFPGQRG1azgLqfWOs8ZoEs2
	546EyR5phxvsQLdBIHt+nOBNquZA52bosgTmQOEi6usoWVMTsQDq0tX9LclhuK0dAN6FVWGSaRGtN
	nPcGprtCe7glxQVtueSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Z5-0000000FJIh-0Dg7;
	Fri, 23 Oct 2026 01:59:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Z1-0000000FJIL-3MIU
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 01:59:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9Px1792129
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 01:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=; b=XAIVzq3Ypb2t5gbB
	JNSjrpFOj0OeSlSy1sTvXDFdbHyZcTYl1ePCaYYNHt4upOcl9B0fDV5OUpCSvNpI
	8P6UQVicjM3weO5GFr66C6lL1XSuHcL8mp3+AkqH2hHhzYlBrpPbDQekw1oDBHId
	9TxzYE2SOOUtL+2wvA3CMHLP17T28F1HyEzvHNsXEOM/3wOzDnilq/be6wZ7yidZ
	/mxUrqfnDBjwDsKLCEYwmsQF13C3Jp93WBo2bODYq/RTCB7MD/rFDyZ+qYtNp5mc
	jU5QP5lsb0n//LDhpOiNrVoajbCZJ2nsbPzJeJlsr/uJqb9qUcHmNxNwWA4nn1a1
	x0W+pQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0hycb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 01:59:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so328923a91.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792720762; x=1793325562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=;
        b=d5mnGmgtxy8osWIgPvDxPJ6H0Fu8HUcnzJ6un+vcGrQo1GiKUSSeAz2dzZAyv/sWhV
         PbBzePh4m6U0a0tmZUkUefmgw2u9kA86zWUeEqHxmGvirYCoNBnRIH5SL3ZPFo2Dw3FD
         GktQKqW0YLgN7nuS2XpAsh9OpPwESsQfs6d5ZJuELYFG6Pne73vNTwTOQknvn56A0dat
         D8welk5yBB0zs773LfgU9IqWxoli8FFJxgKg5W9DeI/WYgVqm5kPqU83r5kBeYW5zIC+
         aowqqmX/8OQbs3E5CktjAtSusBif/lbmfSBnnDOrINzZxAx7x7nH5c2YRhndDl04lgeT
         K73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720762; x=1793325562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=;
        b=W59T3MJ6u+xfh4hbP7Co5N1LVQv4jfb7seAYw14y0rn0cMWY9gZcow0DPVxorxZhmM
         bB468YzKC9Mu9L8ooAzVH2ivBOWCmqcEV1ojy+6h8zBUwoIhWDbTMINN4iCWuzreKEjO
         AHqI3FjNzzG1yfMPklmzVKQreQHcY2UNobREB45VuTI5IQZ8p5vxC3EXMyd618tVIHHF
         vdkYuPSFGZl8a7gRrABsbXagpcxahvNPc4HdqEJwDpyQmg5WftvcNNrT8vr2EJX54fBa
         xahkVldfDvsxtqY+C7GB4xLhyHSGfD+K7KjgleKRi1U0ek1T3PBE6RzaGEx6juv51hro
         6bKA==
X-Forwarded-Encrypted: i=1; AKwUvByjOc7Ojp07J2pe7KJ2yMA0epMe4Dgk6abV9b3g73ygc+Lj2bke486PI6bSJHbrbRRFKWtHR4c=@lists.infradead.org
X-Gm-Message-State: AFq9FYLW65NEv/aQ5tcaLnIqDsic4ZcA6penxbGs5Grpt1r9kgxYNgwY
	HLBbjOVkXape0xDidIP4rYbj5FIgDksRzKDFY4jbPJJ1kd4/QQJsHMBtODaSuui3ZyYIiar31hq
	CLS5QRdzmsQZ2zDpEvFkFw1lNqRzVuL6tCAWsx4c/DOl899Z9Zr46o1yCgvs4/DoT+mgWDFIo
X-Gm-Gg: AYBFou1mXqBoVXjIRMAwUjYXNWRrA4SgVn6vm0Or9cHUkKlNqTFBsAwksQVZONRvfQR
	rfa+urPr78hhGoGSe/HIZlqW02YJQb44I59dZgoPHfExXgoVcEQeP7dSAiVqtgO+rHBfrStKphI
	FaUbUIZTwUlVR6JgpfwfParST1CfowbHihC0ylJcp6Lu2hRmoQjQYoXyT5Z4BZr0KPoqlSJqyjm
	KAI7G/7QEtWFIk6067casqxPxMSqjY11ymZ+kW0P2aolWZUlqnx6L1JWZPeOnE6v4XpqXtG3vL0
	Z0uXjIa/r92HemjtCwMCkh71RbLlKG0lFUuyx5i77WBiXDnnXuadEwOwLB8+MZrHWyESxhkC4KP
	4EgJjkPzg4JR0RBnH7mccG3XjDN19tGXZFbOv1O5TCgUgJJg1kUWu7gNQwSTzzkLYIr2jub0U4w
	==
X-Received: by 2002:a17:90a:dfcc:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3adce7c7897mr585321a91.53.1792720761534;
        Thu, 22 Oct 2026 18:59:21 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcc:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3adce7c7897mr585307a91.53.1792720760990;
        Thu, 22 Oct 2026 18:59:20 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93e0sm1232848a91.15.2026.10.22.18.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:59:20 -0700 (PDT)
Message-ID: <4fb7840a-27af-483c-927d-f99d33be334b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:59:17 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
 <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3rKx--KUvpjsfcyUpp9mp2L_N29QecWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNyBTYWx0ZWRfX2kzQzXzgx55d
 eidb11c1iYqPV/r6aP9l/9s2SDBbWThW9m2KbMmrxB6wiDaKtldfL/S7QiPDvcg2REGS5CbbMbn
 fhL1AoFmUbj7bBOT/yQyKY78IQNKnvt01JYXS4aaoZscP7+gnV3AXbz6IQWh50HvLjPol4UfbVK
 xur9usOrCd5TR4pHC/yc1jG8C7cN9PLMsPOH7X++5JHvP+sxFqUkWVztjMqib++xQ/KImytmLTa
 1htqNnYqjgnV+ZoLNPSQ/9bmgi7uuvhVGm1YBudf3mcFJXaNjEVzXvbXlP4rat4fIc/9qXuiZBm
 WNPJ77HDwOFri1haoYSrvPgklqPeZPeSSL9CKgLJIpfohILwHDgvGQkbeh6/loUWyBSdlZxasSL
 jrWIEycvFDIIEWT/vgdbIM1nl5fwTuu3PiPslYIZS9mYtjPfBk03nnqinKiw1/wepyAhBzsUAvb
 It5nG5PS3ZWUYXT2Thg==
X-Proofpoint-GUID: 3rKx--KUvpjsfcyUpp9mp2L_N29QecWm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNyBTYWx0ZWRfXyBhm2hgBz+Cy
 ni4cGgTE3+76Kl/k8mrq0IoZXrcXrZUP4UIRhNKAAVPmLIfZU10UaIoGxeQZcEDbQ4UvjbZpkmZ
 tPaE32FNshwmrmfh22jrxbIcFWZgmqs=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adabf7a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RU906sw5RCHCpFq9C6YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_185923_978666_58C5DEE6 
X-CRM114-Status: GOOD (  16.28  )
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



On 10/22/2026 9:38 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 07:00:31PM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/22/2026 5:20 PM, Shawn Guo wrote:
>>> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>>>> + linux-arm-msm
>>>>>
>>>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>>>> to increase peak throughput.
>>>>>>
>>>>>> But during the RX process, a phenomenon can still be observed where
>>>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>>>> and this behavior repeats during RX.
>>>>>>
>>>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>>>> gone.
>>>>>>
>>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>>>
>>>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>>>
>>>>> FYI, in case someone else runs into this: with this change (merged in
>>>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>>>> working with the older firmware that Debian trixie still ships
>>>>> (firmware-atheros 20250410-2):
>>>>>
>>>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>
>>>>> Probe and firmware download succeed, but every WMI command times out
>>>>> once the interface is brought up:
>>>>>
>>>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>>>
>>>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>>>
>>>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>>>> image:
>>>>>
>>>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>>>
>>>>> On Debian trixie that one is available from trixie-backports
>>>>> (firmware-atheros 20260916-1~bpo13+1).
>>>>>
>>>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>>>> kernel upgrade knows to update the firmware first.
>>>>
>>>> Hi Shawn, thanks for reporting this. I just had a quick test
>>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>>>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>>>> any ath12k warning.
>>>>
>>>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>>>
>>>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>>>
>>>> and the md5 values are:
>>>>
>>>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>>>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>>>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>>>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>>>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>>>
>>>> can you share the md5 values of your images?
>>>
>>> Hi Baochen,
>>>
>>> Here are md5 values of the old firmware shipped by trixie firmware-atheros
>>> 20250410-2.
>>>
>>> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
>>> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
>>> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
>>
>> this is different from mine, can you try mine?
> 
> Are you sure this board file works for my Lenovo Yoga Slim 7x laptop?

actually not, my board-2.bin may lack the BDF for your machine

