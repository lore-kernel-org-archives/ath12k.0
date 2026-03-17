Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A26F3381A
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=Jem2FoilM9uuCreD5RaNuQobER
	dPc4Suu2BF9d2DcfsaW3vL4uQLY2l53hGMKalu56QbbBWCvlvt4cPDCvPUx6bP7jD2PGEjMiLYEZ1
	4OqcusIkV9bfeQYFQUnOAs2EmxS+dCtJ/dAsX/jKOzjfG+3ni/6tzlpFWW2pKJvIv+nkWjZ+qRoq0
	4mjubLOWlFt/F4mTE6/s2LOHZShs0i2wXJhCkUESbqFrPx5QAO4HHRtU4eYFsxFam90VMe0iDlFAa
	euHhzE+1h40hn1FPoaiHiUC76vTw1GLqV3vGHYH9dJsBQFtyCbm4kIJLJ3XIskw+E9ZD5STrb/k6D
	gE2ge3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9K-00000005lZ1-3mVb;
	Tue, 17 Mar 2026 08:51:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9I-00000005lYI-4C32
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 08:51:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7h3r01639617
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=ASZ/MVVeGtJMu1Fc
	XLhAANnTMxH1a/V03vG/LTkSxc0F4h1bFIMtAPhjCNfhnr3REamoVzaRvJ/Ifm5q
	DWpnOtIKVZ2lztx3+oTq0s6N3eKWOBuea9uI0iDZ/3DENDJ2W4IrKaTj0qitnYsP
	PTKVUSzhCM3E4DrZZcryCru4YuPS/gsXqVf5pYvK1u5TnwI4y6JlvXMSeP2McicD
	+oZUlt7pYG43FnWbT6wLNcih1Qj/3DZZC3c8zJFvrpMgtwdfF/FtCG5S9fRhbnGF
	JD5kglBhyIBwiy5g50f9b51gKOOlJnxwyhF91X4sV0+pn+xbASdGOs+h0EFSpdzf
	YmkcHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0begu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd98d96382so621141285a.0
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737495; x=1774342295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=Vk6V8gR2EkNmYYm/Z5YkguACDO03k64/+6ntRgPKIx/n6EkzwoXcaeGk7mLwhPGDlJ
         S/p6TI1VqaJSEGI4seTqJXc6srPegXa4SrmfgCAf+lUcFFVaDjy0A5NPDSUEgqMq07Rk
         qtTlBzuLK5iGnMCycBy/5dJYDAGq5mVHSblqKhgL4Iers3im0BSq4etZjKbFiebtmfcy
         6fybeLt6xpBZz/lhMUt+spjZ5aM6CPUcz6KRO9Iad1dJU/t1atNQYMaq5fdl3lmI4ysh
         hzuqBnKI6J+SstB0gz6p1aW0ijfLxaCn+fG/5TfDQQXTnij09jbvrwB2x+S7r9mV8+th
         ZFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737495; x=1774342295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=mav1mEXkl45AOBzwwAH/MiMJ6pp1haDKj24xKI41yW56PZUrn3b2QWYfL3579n/IsJ
         qQNPzX86yypVzyGLpx7CUPkCnj62wksASLTAl+yYnjbHe/ew0GsUAFPTm+ZmwSrrJw7m
         cmmg2jkcabbmkEBsptm7eJdChuPWrXZe+SBkpZnq7SeUkhPIWE8CE5jvHvpKl/PWCB8Q
         emDLaFNZ/RKvXqYxkb7Bsz7YtDzyW6QKvQCnpT4s9IszL+Cven/xLXzRPGbciSF7egBD
         cg+YRKctpqSjOaWHjzB6ZPwWAn3h5j8Fve8gjftubKoDMYKG47TLHgato6WKGpuWCH4e
         GiXA==
X-Forwarded-Encrypted: i=1; AJvYcCXnumk0z5iUUnV1ROFDHg0Yb7p2B3aB31wN8Qjy1J6E1tzxiP4KpDzrAyC6m20lJvnNh+1lO+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY1XfnS1iUgqgJn/gWdeUMx/RUcC7pncgyQiNCqwq4S7DSjTJc
	doF/hALknt7LUWXKT2tCWTZSpkCUkZDqyKsanmhPi063pn4QmcLyqkTY2UxoBg0x9B44mLlLY7+
	sDcmhOW5h5pAA8tBgyTprzRsA7cO73G+xv3R6WkT/hjneIiYLWPea8DjTY1I4PrrN
X-Gm-Gg: ATEYQzyDRjsKQl5iLXZ0svD+bB27yIKitsSGKG5recQfg5VvIXeCYxuWyuHukTObLaJ
	zhfhy3OGRND00exgpQC3TAwHCPTAhF/sD703y4M7Pq9qxzEIVkhIW7yMoEun46h89fx8YyCjyO6
	NJvjPYZvV/C18F2r4JTduKtVYaOJGHZgcuH8nU4ehupmc3L0JfqKVkCwuEz5LecWJsAn8dEv/kV
	5yPO+i05WKSPHNvyYNduM9+fRuJj9Jl16wnZDJoYKw30IcPb8yP3vkreWgAs27/UhusXRNyyuqX
	BOkOSCYCC1kOJm7KK/HlHxlw5Grlt8zCYJ6BxyX2gOgyE9DX8pigh+epWpZqIf5AmckBwsMx8A9
	kGZ8NjxGkt5vjkYQh/S+xy79YNszJFHFCVNR14xPCI8efSIpe24N3nl27yYMKIrq0Z/jxIexHmi
	MXZN6/AXl8
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966584885a.41.1773737495214;
        Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966583785a.41.1773737494732;
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm46732245e9.10.2026.03.17.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Message-ID: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Jakub Kicinski <kuba@kernel.org>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260316172251.2d57d0aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BTCQ-C-pusiIyQOjrbhRnJXtLQH_2XmT
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b91618 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=rySjVtX6Rl8zv02YFYoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3NyBTYWx0ZWRfX/ar+63U2xFM7
 OIWHO7o+5LhEfbx7P2gWbyoE2mtiqzXDB2Di9NwZKaos1oG1Vd9cgCKpYdwPhDx3i5chOHRGjE5
 8l23VRIdZgsA90ayTPQCfTKL8iGFMlPnZkTF2CPrzjWdxtMqyAPZh3nIJhjh/oNZZoAt4UJwU6o
 7i9cEuUHE/gP0DmAGBfIBBGYZ55BOFkUO4IjynOSrKPr6qtd6eJ/wMQO4ZfM+/H2PJeR3ps5LhC
 zGglYTi+hR1gXx2FXFiNbtbrvwD5b498n2hns5I4SUQgdnYmwSj33JCjHudky9Rih5sey9MhW5F
 mj+pBIiohO+PHYtLQhuFRo/BcOKv5TcAtObWp7gVuMhM4rKJio8SPzF8OTx14Yge9vBR7nNpd7S
 wv5fN7xq25SPGHdWtJoqhq5LYce4OV/5XQ7lGAqHfmw9CEu81VGQ1Ari9i2y6rj0LUq5kjZrmVp
 vUflrlDdYR1pV8EAAQw==
X-Proofpoint-GUID: BTCQ-C-pusiIyQOjrbhRnJXtLQH_2XmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015137_048032_64E52D1D 
X-CRM114-Status: GOOD (  13.68  )
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

On 3/17/26 01:22, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>> This series is based on the immutable branch [1] containing the QMI
>> service id definitions along with some drivers using them.
>>
>> How a patch can be merged ?
> 
> Wait for the dependency to appear in respective trees after the merge
> window then repost the patches individually. I'm starting to get
> annoyed with all this cross-tree QMI/MHI noise.

An ack is simpler for everyone, especially when they are trivial

