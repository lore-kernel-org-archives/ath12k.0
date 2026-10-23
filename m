Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12C606A31E
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 02:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SgImiEEp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSPTnav9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bNOGElq4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=; b=SgImiEEpLHKDAq
	7EAOEUkBIR+BXFkR7Hn6MhUyNXRQ9sMOm0zUm51kTmXsvKHV6XH5r1cyt2nq7pX2Ua80KU+UB7Kpn
	XDFp9HGcEsxApkqdsIwPOrylnAsZFkdhVxqH1XifmMAQnnuNHgpDqsbiOSzUOqL3d2ZNjwuewiqea
	1QxEr7C8IAa0cK47l7wFbwcqESqwNtER3YNpz19bBbkiTuIOOoUg2osEVwFZU1gxFG7bmZj9VTMde
	LPisYsF9J3hZIAOCK9Vqfkq4ZFCEB5jRUhElLU3SRQHnM8mkWItJVlpk3WWGpy/MgeS4x75pd7X80
	SJUQBiJ2QDH40PyfRI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4me-0000000FJwa-0jar;
	Fri, 23 Oct 2026 02:13:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4mb-0000000FJwC-1ygt
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 02:13:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FAMI2376957
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 02:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=; b=TSPTnav9ABt5KOrf
	MhgzmTWAuIKOiBbmrD8KYGQMPa1VMRoNH3lDvCj2fj4ahX6HzNCqybglxI29ZzA2
	ohGoglDnYYQXJAs1RN8dC3R1LHpCpv9SG+Ne0dU88gQF+X+aBzkQ1+v/eDWdOmoL
	/rfSBWQv3OQrUqq+UMzp8bvmgloYYqsr50+fy9tecjri5VVJuDa0uPJ82gbTOnQC
	j4Cj19ZydWLuhg2pLC0BqkQXCe7+nwodQz8ircYUxEtnHf/Iin5x2+lDw/qG0uXe
	acKXa17PM1XdOU43/RXefT1Tq1pas8kG4fchOZOLWMhy1J86Cm1hE0XfhLZ/k1C6
	Mz2wmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmr9dt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 02:13:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so6736875ad.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792721604; x=1793326404; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=;
        b=bNOGElq4lY1el7Q+KYLn3BQAHrifG+dQk3qe9tYnma4n+9j112Iu113LdXtbvdaI5v
         dZKReYGtayaU/kdVnPTalZROI6+zHf+ekLOxc2vlUV5DQFggOgDIqcK/L6DFnN4v7+XY
         i8V3rD1/NhsnOOOWNnjIVDrfI5pFDX1jnVWH4Ny5tO8EDuRRDyYofSI/s6b6JJqq96nd
         qlVAVn0WgP3ohmf0ttDGZIuCGyQgP6doNkRE4jbISG7UMmPt82K/9IvxsU+GZ2tDJhBu
         d15xEOaiSPcDf3b/w5kFlurozXkzVleBED764BLL/F5PyXvQa5/BBwyo/JuFpASE6VZu
         phbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721604; x=1793326404;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=;
        b=O0rpr+59toG+OqVCRgHdUi81qpFdtAfvgDxmZqAfgZxTwKCL5DFGGXsH22DqKW+koT
         2l5stgjkbS25lqJVjILDMVfdy9xfNGA5q447HrenBIwDmJKWiYbZB0FJqdiXxjCpl4Ft
         9dlqXnEAvg8Y5X6w5eopM5WUHhHq14O6gku+a06SpjrrVHWG3JesRrFflZ6zFM+fKmaZ
         YB6JGQm+110OZj+hcWOWW+4HG4ffkwNjynwOQYhPja98YXKAOjyynlIP0V5RdxRPWi3M
         UGhrEbKK1Vx1gM25Rjm070Lv+hY1WNK19WsiVxAlfaOrAG04IskhrzUwSVjkGtqa5y6h
         pnLw==
X-Forwarded-Encrypted: i=1; AKwUvByv/1esIa+K+GK9SuJEwfwLtYIYzK+/kDINCkv2iNRo2JjdhFNyjH2r84x26Zjy9bMvx1lj7x4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLECxnOgLPz2dDJ+qBQP6/R06ObReLrWPqFxiksKcczuR1NlBnp
	L5BUFwugPcdhBIjCaENrMCzrdAygvB2KjaIli2lh8Wp45LceUR7JVPholVLmnREOPlkZtp86f+b
	hSxm1VQEw8oTzyVh9+C05IrLO6UpbhbVwW2tOEMIMwBLJ+vU/49hPu+uNqGiAeiJv
X-Gm-Gg: AYBFou1DPuJmjaT1N5bXDEksnm+Hb1/SU6wBelE8ja2n3at+7kYHL9+2nC2CPullD2t
	LbP1o92wgvlIynQHKqtA0ifdMTLavAjQQCzKJ3UZgsCnwEUcaH6VB3oakCpOm5HvlY8FPnuet9N
	26YkLtZ03tSuUuNx7w6El0bEriHVwvn8EJIEZXFoqHPG6RQPWipVnzL7YmxS/XqmTo4Dobcy81g
	kZazFOt5LHS6Xxmk9nuQf48DdOstPOpFtDocrnGFtm93Pz/GJ1Ei0GX9caoZzljHv5jDBuBYrwL
	zXDtZWovVSpEhwBjx7KkXojaiydBXx9MJkYG5mJioG/aN6lgpM0KLXrnBUlHxcVesY4SoFGh8dw
	wYqw0l+hGze9+NieZbD6puvsH7bav1jjIeom0jOzqZgy4ZK01ptdKVglQdVLQp0zTOTkcL/g2ig
	==
X-Received: by 2002:a17:903:2307:b0:2e9:8b2f:3572 with SMTP id d9443c01a7336-2ea7d0e3d95mr9255295ad.26.1792721603523;
        Thu, 22 Oct 2026 19:13:23 -0700 (PDT)
X-Received: by 2002:a17:903:2307:b0:2e9:8b2f:3572 with SMTP id d9443c01a7336-2ea7d0e3d95mr9255095ad.26.1792721603006;
        Thu, 22 Oct 2026 19:13:23 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6b862sm4215985ad.1.2026.10.22.19.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:13:22 -0700 (PDT)
Message-ID: <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:13:18 +0800
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
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HJESqpCPwYleSS_GxVEjQLdaW2v6Drzd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwOCBTYWx0ZWRfX4/BQFiuI9un5
 0Xz1JCLouOFjk24R+E1fsIg7cbODPm5VIF9voMnyUHwH9fqWeB+hEElzEkQVgAIQTljUwNbjfp2
 t8Mab353bsTuTnyy8RfWqVvbGccE0+U=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adac2c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GNa4QO3Fkq167Ut2XdkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwOCBTYWx0ZWRfX/OcFSfnwKYRO
 mye0BNiP/6ocH4CwTu9h5NHJU3xV6lhsZeQx6DaBMMlpAzoLnJe4QS4PDvuy/3umB/sIjjZmx+Z
 IdYeEZ4sSfPyERu7H3GaIBWzSfFLW6UtipEuAXQjhaCiCag8zOk8vu8HyP4k5iWZkTjK9/A6AiW
 lvKVWJBHBrMYcvub50i0Z0JTN6rDiJb4eJNnXS2mxKB3ASEo4Z8QY25Ew5JGNWB+X0XdJyQsdqv
 jhUMHkedr7cOkJWBGqcggBZBaRSzzQU0AG4jXFY9c0l7bfD099GfrK8IyliN/X55Qz47u3iqzUD
 LdTyLrDmOZFP/LSVIu21du3JIugFbEQnx3gvBmbR5MXPkTdNl+N7Zkctl4gyvv0zAtCs60bEbLK
 LuMN79ZBIVpfPK67/thYbXskhi1cJ16v96bSVBhed1bCmbx8dhhfCTnpHGfXPSC+zQbCwGGt+RR
 Wd4a+3K/nXmRVl7Vnrg==
X-Proofpoint-ORIG-GUID: HJESqpCPwYleSS_GxVEjQLdaW2v6Drzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_191325_524665_AC2F2C8A 
X-CRM114-Status: GOOD (  25.65  )
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



On 10/22/2026 9:44 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 05:20:56PM +0800, Shawn Guo wrote:
>> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>>
>>>
>>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>>> + linux-arm-msm
>>>>
>>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>>> to increase peak throughput.
>>>>>
>>>>> But during the RX process, a phenomenon can still be observed where
>>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>>> and this behavior repeats during RX.
>>>>>
>>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>>> gone.
>>>>>
>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>>
>>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>>
>>>> FYI, in case someone else runs into this: with this change (merged in
>>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>>> working with the older firmware that Debian trixie still ships
>>>> (firmware-atheros 20250410-2):
>>>>
>>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>
>>>> Probe and firmware download succeed, but every WMI command times out
>>>> once the interface is brought up:
>>>>
>>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>>
>>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>>
>>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>>> image:
>>>>
>>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>>
>>>> On Debian trixie that one is available from trixie-backports
>>>> (firmware-atheros 20260916-1~bpo13+1).
>>>>
>>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>>> kernel upgrade knows to update the firmware first.
>>>
>>> Hi Shawn, thanks for reporting this. I just had a quick test
>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>>> any ath12k warning.
>>>
>>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>>
>>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>>
>>> and the md5 values are:
>>>
>>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>>
>>> can you share the md5 values of your images?
>>
>> Hi Baochen,
>>
>> Here are md5 values of the old firmware shipped by trixie firmware-atheros
>> 20250410-2.
>>
>> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
>> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
>> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
>> 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
>>
>>> and have you ever tried the upstream mainline
>>> kernel or the latest ath.git tree?
>>
>> I'm not sure what you mean by upstream mainline kernel, but v7.3 should
>> be the mainline kernel released a few days ago.
>>
>> On the other hand, I just tested ath.git tree at tag ath-202610191908,
>> and it worked with the old firmware. So it seems there are some gaps
>> between v7.3 and ath kernel.
> 
> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> the ath tag (working). It lands on:
> 
>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> 
> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> and works.

thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.

so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.

maybe I should submit a patch mandate this rule.

> 
> Shawn


