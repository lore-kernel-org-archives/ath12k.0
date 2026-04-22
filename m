Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC1F9EDF6
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k356NnlQ3YaTZGZ5ZJB7FAqNTgL4ShgGY/SJI/0f+Bc=; b=3oPplfdjkXV+dYrrfTXoUWBayu
	zusW9zZxld5ifWO8MDSeGUf4p7KbIIDk1Fe6lXRGICvIyiWdOT6W5443DvBrnyrdv4SoZhK5AcYlX
	Xe+JJ1R4CdRz9SCjTXBrVfHFcNQTMuklQrtcp9yeJ4qwv2f8lH+EH8q0XecN4n94r1oHvS1KT9nA6
	UnpX3ElE1wQoIWnZqDbamqyEt3B1cRZlgHVNvdjkc7IeMARo0BURHwllcTR1qyfYM1RwwPbInLI3e
	ifjE+e99E+x5r/pug2mLVS0vgic+wkzLdRRW/lU/tHadEQz1dln7MWsfYSIXEgjIsMkiuQNmExvwn
	rxYmRFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYyP-0000000AOGM-2aAv;
	Wed, 22 Apr 2026 14:54:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYyM-0000000AOG1-1pz8
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 14:54:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M9xqIj2123756
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 14:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k356NnlQ3YaTZGZ5ZJB7FAqNTgL4ShgGY/SJI/0f+Bc=; b=DY3pYeFsIDQ3TysO
	dPw9JNjc1/uwdnKvccwLObGdGnxzyyc4iOH+TrQXtmmZjU3zrXHahY8VIudmoHap
	aUkztA5KVg6ZXucs/ZPySYNKijIufxAdmKjXceFEFvAktngT2CzTq2fKyjnmNbih
	0Q3OVQsOvptcg5OMYYfuWVmT5HW67dG5el+m9JFUPXI7/TOo3txDJ8DqpqE0DWLk
	zTOQ+Dc90yQFyKmsqR4bdzUv39SDeJpcDrlrEkevpJydTEMWUfAlIUaxvQQdZVqy
	9AAe2Nd13h2OgvGu5MmqNXpDUFw/Bnir2KfdOEQtN8f7Fe5qa9GinrR0TDC8Th5a
	n7fErA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfuvsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 14:54:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so7478810eec.1
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776869676; x=1777474476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k356NnlQ3YaTZGZ5ZJB7FAqNTgL4ShgGY/SJI/0f+Bc=;
        b=R7/zJ0/RHHqHvZ4+a6MEJ4ytCundscpEenesxf+B5Eeyb/3hv32K22Wb1V7a/pGcgA
         3+6Ar55IiJhxN6e+bwW4XtVRT5XMH131rtMrn4zwlFV/LSOZw3O32oH0OaoE4jQUY8iD
         sn/arAQ4pz8MGSAKokBVNkphKvA2ZrOgyzsy8YCrUV2z/ovGplZSCkyw1iiyg2rvK7BT
         0+W5BESVcM8fkrtb1WrBKd/N2DyrqLoCGCwPqpzbwxu+lsBOioNHJszgWQKRyCOTY5XF
         jeS+zQR3RWRfazrQdwWvqFkNgsKXADCv3+iFml8RaGymWSDXf33utFHB6ggvdbQQiTGb
         Zbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869676; x=1777474476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k356NnlQ3YaTZGZ5ZJB7FAqNTgL4ShgGY/SJI/0f+Bc=;
        b=slMzVSEJ8AUm5ZlWAmvGfg0fKTYdu+YTjGSlIXwqIyIg1CryPgocm07K1uL5Qm9OHb
         ssI8W1E+Jq50s+ZP0aWjV0MS+Wf0k9DUF6jx0V6WJYzAJZEhM4aToUndqOTfOdI38ek/
         C5jN7UUMhBWjVDb6YWBx9omssEQDiRFDNZ24H7ehr/oydbnE1yqQswPO+GJoYYoh1vsn
         6P0Gj1jNbcXkRqIZcOTn9YkK/aPI3ttZbZMobgb7P/dJYL/9w1m2x+VzfAl0Plk5ofzz
         C8TTzFxzv7DUxgNe7zr5v2dk+m/Li9EXRlhVH1rWXeL5mzUoK14RkpgIkQJa4nV8E6lW
         khSg==
X-Forwarded-Encrypted: i=1; AFNElJ/iPAwH3YWi84uVT4THp+4Ur+vR+XHX2ZudtNj8rGZ/ywFkLlaZfS3v+3EqizwEH51umSCUJOY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUiqVN+CtMf7v9u2esPvjvI8iGRZcTrW+cy/ndDe+FgfI0a/PW
	fWJ83TT0CIJEQIbE5nxs9FVyza1MYWHG5iVt3Pl9VcWlLJkYbX/Vdxt/TMkLrvRCFVPFCLGNndM
	8wT2SLwoURvXMZkHE9IvzmsLgiZc6T38g/kKVgadKxD4uFoKum1niZHIC1pxmgfuW7sW1HisC
X-Gm-Gg: AeBDietovLQEILKxf6V+DCFXlatpkBoqsb5FOUzoP0waQ/ULecBYwwcNAAm8LhCQiIz
	77yAzPH1ztIiN0AgFPOKkB7SZJ463iQDfrqmRuYX7du9Xli5W5YPI+f6ZY2VOePSru742stnHzx
	3BPTkfu8pDh2O6yADSPZRzgWHZfWcge+/hAMRWcRsQTDfvpVccmfmY78f2UQgtEYp4bllHINY/5
	viYvTWOBF8JWNAH+VtJBSqrhubxbBX33QJE30/WsZAnFeHDfQM91wUR5/M8Fds6+0nJ12gKTu9A
	psAhKANGUn+bZ62rf1zYojQryt0S8nq+VGmFkRTBi6IHFte7+NUiICdZCQxrpDkDX8MKloitj4s
	Y4teL/jFi4lMTuC5qUaC/rDJO7Ee4v3KJdXXOmxekU8jou8QiYCeXyF4/fj2bqLebXJAzy1kSr2
	fDwSF9AUIzxsnJqG5s
X-Received: by 2002:a05:7301:1f17:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2eab9753fd9mr2268655eec.23.1776869676111;
        Wed, 22 Apr 2026 07:54:36 -0700 (PDT)
X-Received: by 2002:a05:7301:1f17:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2eab9753fd9mr2268633eec.23.1776869675573;
        Wed, 22 Apr 2026 07:54:35 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm22862382eec.5.2026.04.22.07.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:54:34 -0700 (PDT)
Message-ID: <e7d86d05-3b10-47bf-ad9a-dae82cff903b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:54:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCN9274 fails to start firmware (-110) on Linux 6.18/7.0
To: Doug Brewer <brewer.doug@gmail.com>, ath12k@lists.infradead.org
References: <CAG0V13REH4kwFq+w_FJBf98NDXbajyZzReWjFu0EVzt0vn-Sxg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAG0V13REH4kwFq+w_FJBf98NDXbajyZzReWjFu0EVzt0vn-Sxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8e12d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Mu_HZm3aa70VhKiTeZkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 4p_XLXoaJQHqmROBp2SkAMMvw2aa9F34
X-Proofpoint-GUID: 4p_XLXoaJQHqmROBp2SkAMMvw2aa9F34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE0NCBTYWx0ZWRfX3MgAwMSkQn+j
 3QY16AEYGD2Edz7DT8KuSBqZgWyMERTkNoe4w/wl2h/FbTAYVe9uiubHZIgpXH/+bzKdM5MpPzn
 9FbMRp2TJ0COCbASaDGCY9uLCXyFk3yA9JSoI7LKruY95wP6rh3e4fAFMaZi/2fInl9Hz9O9YQP
 67TOtkwAzCzVRdtftEJyGWXfaD62ct28+3p/g+FMzL1uD5FnnyxLHChRnT7lfTsY46UjjRDGNp/
 B/AuRl63MfrT1b0K2MrROJBtobYYKDXqmqdDfCppIMHH8a/P2AvNLcpoNCkM8ibNGyO1jDCVRWj
 3hdn+DVICMkdS4pUKfWR1gmZaakSaNJGGxPjpjT9ai/emIFFZ6ecFYk0ZzMwjGfWMG44SaJBhE8
 XuREvZqvW4DCNoU5ayJnZI8zs5o+wmbdepf61h1XvVFpZVM0EJ+rOuPir3XabPCRwQr8mMZ4DxJ
 4SBQs7LHqV8cSI+zHiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_075438_481345_5B161EE0 
X-CRM114-Status: GOOD (  12.93  )
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

On 4/21/2026 8:14 PM, Doug Brewer wrote:
> Hello,
> 
> I'm testing Linux kernel 6.18 and 7.0, and the ath12k driver shows the
> following errors:
> 
> ath12k_wifi7_pci 0001:11:00.0: BAR 0 [mem 0xf2200000-0xf23fffff 64bit]: assigned
> ath12k_wifi7_pci 0001:11:00.0: enabling device (0000 -> 0002)
> ath12k_wifi7_pci 0001:11:00.0: Wi-Fi 7 Hardware name: qcn9274 hw2.0
> ath12k_wifi7_pci 0001:11:00.0: MSI vectors: 16
> ath12k_wifi7_pci 0001:11:00.0: memory type 10 not supported
> ath12k_wifi7_pci 0001:11:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id
> 0x401a2200
> ath12k_wifi7_pci 0001:11:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-
> 09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICO
> NZ-1
> ath12k_wifi7_pci 0001:11:00.0: ignore reset dev flags 0x12
> ath12k_wifi7_pci 0001:11:00.0: qmi failed set mode request, mode: 0, err = -110
> ath12k_wifi7_pci 0001:11:00.0: qmi failed to send wlan fw mode:-110
> ath12k_wifi7_pci 0001:11:00.0: failed to send firmware start: -110
> ath12k_wifi7_pci 0001:11:00.0: failed to start firmware: -110
> 
> What could be the cause of this issue, and is there any possible
> solution? Thank you.
> 
> Regards,
> Doug

Please create a bug report using the guidance at:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Then I can assign it to the engineering team.

/jeff

