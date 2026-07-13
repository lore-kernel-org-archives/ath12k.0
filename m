Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B9C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 03:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/I7ysKPGmLo31nVKXGt3xJ1uJ1s5WIsQGW+XAUac7eg=; b=Dh74K+qYs92ROo1wAqHiRoHklS
	MGoqgJb4MCDegsfnn4lxSG7VFmQLuFZsTz7Ccu9u/dx+PwSEGR8yyUrogQsrp/QxS+KXfn3TGgAHg
	Pc40dA+e97jPdhBCQVL9cqOFyCVQgny39fmZVcDRm5D193i1zAxH4em4WohXTQ+nqmanw5fZZ5rRM
	0VIGYvvZuhVeACPj/dyUAy9mr/rbrSAf+1JmHtQ/eCvvJnOLrSANSCNqGDsOyhYhQqsDdGKcDtMD2
	NguI+qLXoMNi1qJAIaj7R/2SUM2CeFFEWQ2uiUV0O/aYqGQ1RG1TJa4izgcMrEpJYXjkOMtQ8zNY+
	SBRuPSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7Kb-000000081zo-0IHR;
	Mon, 13 Jul 2026 03:27:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7KY-000000081zL-2TXp
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 03:27:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AJbI217288
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I7ysKPGmLo31nVKXGt3xJ1uJ1s5WIsQGW+XAUac7eg=; b=SaE+oz12owg3FFjG
	ut3og67F31ij9ChMII67hOnCnlHYcWs67TpDMJIKsCIuO9tpym80cH/5yGh49uAV
	GhYI3CdKCKlN08+DPJ9MC1m4XqKB3iDMB9Yk9IBJJjTw14wJcGlkolf/mEpZ8ozs
	tb8yqYe6EJEZujzfO9hJAh/gEi5x8qqQ/N6uVexqXnaflkX7lzVeZOsT3sUcmoMk
	ea8BtmeXge7NeRVIsPVe05pXgKWFrKzGWo58nUt6xG17wg9uKsOjVmXRaWHt/hHS
	MG6j9cP4ts4L+K6cT+HC8jCbSLWmB1qc6INVNr129IDOygyKgFyPcmgxUrNOS9ep
	SO6mbQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr43ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 03:27:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2119070a12.0
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 20:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783913261; x=1784518061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/I7ysKPGmLo31nVKXGt3xJ1uJ1s5WIsQGW+XAUac7eg=;
        b=fLi75EVgJjaK3AfM6AmyR4uLtXT1MM8DFND+B41gnsNdUgKfEtUi+H3wX8XoByibGJ
         tmDZiyGFC2t+atQETuqRr+hWVMFLokzyNVf2LfmF3eVa7JHc3INMLSs5/lE5U5LeqKe8
         GUzTt8OdK/Jl6W0d9dL2CzCIBWLen+NFx9zPMLQEC2kZ+nGbBgxV8bJhNnz5SytBGpNa
         1RsmKt6Ttkj8xCO93/PHtSnZVb0sUd2Zt+e9blL1goN4WWrN0ItR8qkoKwyQufBwD2OX
         WiQ859kKCYDj99ADW3e7FMthPh2OCRKRXkIK8YFHaxBhhzBWiFEpYOBL2TWwtZI5tZeH
         XBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783913261; x=1784518061;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/I7ysKPGmLo31nVKXGt3xJ1uJ1s5WIsQGW+XAUac7eg=;
        b=HwjH5NcZLNHksW4GQ3grplcU9tog3UaeHgjfSSbjvpPnZ6HQG7ma6A6rhATaxUrd1v
         YbYAo9fi3DNYbwN/kU8re/VQfP0cdHTWLXSGebNB5wBJ1P34ipOrjxbzttwNSpjcK6Od
         TcylAaMdXo2nRsikMtxmxmHXL7sDWrZql0r8c716pGKz4mg6myfIZrmdJ6tiyns4h+3C
         1kDHWz4UNht5C5RLsW5Ly2ccsHezqne6chGR0HsyTvRn73GZ//TnLP0PlAv3RdHdytoR
         ab6eeyN2cSYYlnHVX14D3c5onD30Awbk/cyOCHQH0iWrfMPhgrMQZKqMQbkzBZb+a8BZ
         xuSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod+/60qDUlqdfLnIifjAD40YHUzFz2MQRF8JEoST+Xl6y3O+cLSGKQN5szqOGIFB17xsPGNkA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyX1trKAHEQ/0Qw8YEtBq7X0TjeebYeGovdZ4qjXqce4oYepMC9
	X3zk+0w97cC21Z4QvmcQIt1GK9BVADLonnAGe3yv58/UNXBSZNgc1vbSu/aq7b7oj9HNS5ChRbk
	j6y+auGqQGpQUo/5aqknCiGUK8fufQUwMh/WtE3M8RX+CZij2cSGOM8bNz59QGijP
X-Gm-Gg: AfdE7cmbWY4OOa53yb+56ZF2VBJTj65iZvhBdQMYUF/UfAwwj7+mVc9bu6Qhf2eCB4p
	fq4Y89AkTCktvXnEuCNozALPMghrt8LUmmxslYx+YiqEvAIL2XzctBzN5OTB6aB+AvhhY1pkW0G
	IiUNcxgBxKCjSArJ7MWBBHsHTHIGK9sZtEd8VB7axtQ9XoV7S1czB2FXPEsn1MV95nTJ1aXzALg
	vJz+O2CPYF7jw7218y3wXCbyy3qP5kCFL6H26iIHTt3Se8A+5WyyHMMFXhYMzQYMMKhc6T4YKiX
	KHyf6Uws9c97Ab77ZNRSO0u6iIL0jhOQvRy6UNKylc8hkEqmIWEFFbTExX1vau1D5GcYmhdJlTY
	B0mq1wsb1jEVijo/mq+Ee6dmFGgurLfnSxrYq/5mxPhhXceg2gQdvexCcIyNQlQcmtMZbYQdGsn
	M758Grmzw=
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr6387481637.1.1783913261334;
        Sun, 12 Jul 2026 20:27:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr6387459637.1.1783913260824;
        Sun, 12 Jul 2026 20:27:40 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm5967088a12.6.2026.07.12.20.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 20:27:39 -0700 (PDT)
Message-ID: <c9e357e3-8ae3-453b-bede-209facf7d3bf@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:27:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: release QMI handle on late init failures
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260708100924.744386-1-lgs201920130244@gmail.com>
 <8133bce1-2b7e-46fb-8989-f5946ff341a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8133bce1-2b7e-46fb-8989-f5946ff341a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAzMCBTYWx0ZWRfX4Sdz770z4rwS
 g9rbf8hsR/spY82MYPPV8k4iah+CgTwM8ZIj+3rsWrCKpcKU+O33PtR9nRfTeYNwpO5Kah20kup
 UHCc2FrDWPv0dFPn100fwO0JaSDj2Tw=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a545b2e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=rfVp7ZFB_JrZeHXHEsIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 4rtPdO8lcEfcRKr1n66IpgyUoMv-KkfL
X-Proofpoint-ORIG-GUID: 4rtPdO8lcEfcRKr1n66IpgyUoMv-KkfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAzMCBTYWx0ZWRfXwy8jkV/QqvBZ
 gazVIqBv16f4Fo+S/3ZryLKAoJl1U37OAAIhpQdz1PjwtmRIYPnxK5LIzGW0TFCtz4HG4lNyGVy
 EAUZYPOq1o2JvuL0fprZBOTmP9HrPm+nBZ2tY+wYwSpw3tyGWzPT9IQZL/vl8P+nWOk56IltS7g
 5iTNd1awtFjJEFqdcvhR3BsHIX1WaFyla8XFTaUU2ftL8zts9RJ4O7aEW+i4nKTuaHlqo4npdrc
 aIMFBtOUTpEbBSqc06lDthcsiekvP14ev9gRNflzd+/8jNp9MqjjU1Pb8P0DyWDSm3+PdJhoQZ1
 cVuYH6k77MOvloUCx/d0XNtPYIx06CriweIzmV5nHToCmkK1FQsOfGF32l2T/4DQtsG2EuxJEp3
 C0U8RJ7+uI6NovPTvBMJUyNStCt5HdQh30w5LtPwJ/X6D5XmXmrEQtffF6EN3mzxeIkXWyzSIkB
 Tj8l4zYoGVuRbMPmpyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_202742_683402_C91A5A78 
X-CRM114-Status: GOOD (  20.72  )
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



On 7/13/2026 11:17 AM, Baochen Qiang wrote:
> 
> 
> On 7/8/2026 6:09 PM, Guangshuo Li wrote:
>> The change referenced by the Fixes tag makes hardware group creation
>> skip the device whose ath12k_core_soc_create() failed, and only destroys
>> devices that were created successfully before it.
>>
>> That avoids releasing an uninitialized QMI handle when qmi_handle_init()
>> fails, but it also means that ath12k_qmi_init_service() must clean up any
>> resources it has already acquired before returning an error.
>>
>> qmi_handle_init() can succeed before later initialization steps fail. If
>> the QMI event workqueue allocation fails, or qmi_add_lookup() fails, the
>> function returns an error without releasing the already initialized QMI
>> handle. Since the failed device is now skipped by the hardware group
>> rollback path, that handle is leaked.
>>
>> Release the QMI handle on those late failure paths and clear ab->qmi.ab
>> so the failed device is left in the same state as the qmi_handle_init()
>> failure path.
>>
>> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..31e9fa9a62be 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -4054,7 +4054,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>>  	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
>>  	if (!ab->qmi.event_wq) {
>>  		ath12k_err(ab, "failed to allocate workqueue\n");
>> -		return -EFAULT;
>> +		ret = -EFAULT;
>> +		goto err_release_qmi_handle;
>>  	}
>>  
>>  	INIT_LIST_HEAD(&ab->qmi.event_list);
>> @@ -4067,9 +4068,15 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
>>  	if (ret < 0) {
>>  		ath12k_warn(ab, "failed to add qmi lookup\n");
>>  		destroy_workqueue(ab->qmi.event_wq);
>> -		return ret;
>> +		goto err_release_qmi_handle;
>>  	}
>>  
>> +	return ret;
>> +
>> +err_release_qmi_handle:
>> +	qmi_handle_release(&ab->qmi.handle);
>> +	ab->qmi.ab = NULL;
> 
> should this be ?
> 
> 	ab->qmi.handle = NULL;

I was wrong, please ignore this comment.

> 
>> +
>>  	return ret;
>>  }
>>  
> 


