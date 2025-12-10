Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721C8D3C526
	for <ath12k@archiver.kernel.org>; Wed, 10 Dec 2025 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jR3YT7nxD7HTAtvYYgGdHd+wjs3G0Ul6NvKLvYosSPU=; b=Kr0WG95VHVmDTSiXM2S6bwhVU1
	8uGEG5kF0gzlwX/VW8npBO/l9vNgv2RxH20Zw6aCPPzLB0xIynClSlT0Gpt+nTXaQQqwuPzTds3yt
	sJg2gzezcPPaW7ue2cvDhusNOXGYEKAOrmWdwGpOtrEryK5cwNLhxR2G8omil1XWsVagw0WxGSU+1
	l4MYaXck0BX0MOCCgE0WMK1AfvZ3RW/Pi+c4iIXMnY6/Bhe8hB2O4p7d6s29O/4EEeLnwO+t1bD2G
	BtpX7p2MLnUc9vIl1Jw9mkhaBK58EC5OPmZtEsR93I99U5IknLEpW7y3ql4av801WBRlvTu1NWvho
	fNtjWs3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBEM-0000000F4WL-0Odb;
	Wed, 10 Dec 2025 03:51:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBEG-0000000F4Vw-0kxX
	for ath12k@lists.infradead.org;
	Wed, 10 Dec 2025 03:51:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LbiW1391455
	for <ath12k@lists.infradead.org>; Wed, 10 Dec 2025 03:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jR3YT7nxD7HTAtvYYgGdHd
	+wjs3G0Ul6NvKLvYosSPU=; b=ZGayT+f4zitpVsItPjuQa5vRptpxBk+V5nyWE7
	ZXsno9ICTNIUjCTHLaMl/wRyY083DwlX5bFJFrjV7sXHyTB8g+u47lZn8Ok4rfyS
	zTC0SOwnbLPUwWwDVd9t4F7DXbyM3WNRwnmEUiw6x8Ag3csl5pimz18VDaO5Hxef
	ZUR9z7VeRSOFANezi4vts7cEmxnbIYBP+6Gk4MLKhb298tndxk6hq7oMqXKzcnxD
	D4WHIwLPN2CiGgwTZfT5Kaj0fAHSfNqyixU0YVU0lauwxd/aRlczvk79+tjHJ9Po
	QAKWwU0wkavYZyv2TVY1uOzcYOPKF2nniIXdMuojHa2JIgvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx1a4fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 10 Dec 2025 03:51:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so5618507a12.0
        for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 19:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765338662; x=1765943462; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR3YT7nxD7HTAtvYYgGdHd+wjs3G0Ul6NvKLvYosSPU=;
        b=NvK/h482VOSWXhFswLg0UNd/Y4et9lIn4Iu9iGZr8sGqGxU+N3Ck4FrdCnS2wtMUKN
         77SmvjOXhNGX9z//gd4WkVTw5wfCVMVyodiHGvHp0GVcUscSjSd34rPW8VZCzRq9aGg4
         uwPT9J+pJN68DTxgDQsnjkLR7JLwrgOXkYmKC0jfPAmPIaVO0PrPl9CEpZ8HD+aO0+kf
         K9B7XhSLctzyYyDWgPLXhj//raU3qJjOPFD4X51/F7YHRrceafO1tWKTgarqAqued34a
         nx7HtrOBprSFCGjPEkwrpQzRKxT0XbWrqlvXn0k4IO+NaL1V9duuMl26be4rNDMRvoRW
         k50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765338662; x=1765943462;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jR3YT7nxD7HTAtvYYgGdHd+wjs3G0Ul6NvKLvYosSPU=;
        b=qT1BEk1Dni6+fU8k1yrVDq6PpL0EArRi9ljnFqneVNmeEdIXBFc/tLJKYbIEaok1k+
         fx+AbswUyUqfdypK6xG9lW5/TDT2b25dRATbYzEPXB9E5jQOtudjnVpc1QrCuVU/yY75
         bc4exU1wtMlMqXzF7EQzQ2JRgQnCTh7N8+2h+ktH/LBIQuURXHrxmj9jtaTS8ihDeltX
         XsZ0rBf4obG6pPG4+Z3+nGV+aQon2m64FT9aFFGk4Nhzey0ILltTQ0YGFL3QEE+3gGOl
         kEpYer8XODmHUnm1U6TaEeq2wyI/SHVkb5oRrJr8IhjOJctgfrBgxYwTDHUVIUeSsMpw
         2zSA==
X-Gm-Message-State: AOJu0YzukXFfA5TM+Ny6cs5pnb2OF1N68jVgJ/G1kk6lj1EcBP4k8Bpe
	4ZLYoAOUqJKwYoR87RBjZcY/qpFuQyf1QnASqL0YgH3yUExmdok+flYZMOcDqNqP78fsHw/T9px
	9T1Lz0KelksRiQ1oo+aGnhL97fKOuPr1NKrYkrodgJemzYIJ1TBPg7EDGnqET6jvX
X-Gm-Gg: AY/fxX66tWKinRK0fHjTzlias1RJCf1nwMHgqYjRdMYY6XXiwhrEM2WjTCQIRxxhLoh
	eWesml0w3X7j44meesiCDkUl6QE5NIPPul8EF2vjovnB0snq/vdnSSETH7AOi5aTC6mbdQ3bG3k
	f7Qrdhcwi1rUWxDjdUDE+j77c6b19joeu2f+p9qd1KaBBgX37RI2mTIIt5GCNZ+fjmkbvw/kKIM
	QfBYCfdyWczGaFGh8SWEtwLjD1+YDCH1f4U+r3UBJGk1oYfN005rG+s84ezKM0KdLRrGlYA12MK
	8D0O2t557RwTxN1GYVDmcq9fdwnpeQ/+eaV7TAHQecLjsx+rFmI+GHFdhLy9c6HOJ01Kx6kbVqy
	8h8oDXqCBCnXV5v55nKqWl7nb4spbvRnFwmDYnyKrhYQKtTGRVg==
X-Received: by 2002:a05:693c:2b10:b0:2ab:ca55:89ac with SMTP id 5a478bee46e88-2ac05655445mr947143eec.43.1765338662006;
        Tue, 09 Dec 2025 19:51:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHji59tJPZjZ2vk/UzP1yy+YhxMdP33Bi7ys9zJE1rd35UIIyvczca1LisV2Qg1pDfLoLhUJg==
X-Received: by 2002:a05:693c:2b10:b0:2ab:ca55:89ac with SMTP id 5a478bee46e88-2ac05655445mr947126eec.43.1765338661499;
        Tue, 09 Dec 2025 19:51:01 -0800 (PST)
Received: from [10.47.204.141] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm47481564eec.0.2025.12.09.19.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 19:51:01 -0800 (PST)
Message-ID: <b1a9a391-1262-4eb0-987e-60bb34bdeb29@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 11:51:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apw@canonical.com, joe@perches.com, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        konradybcio@kernel.org, tingweiz@qti.qualcomm.com,
        yijiyang@qti.qualcomm.com
Cc: ath12k@lists.infradead.org, yintang@qti.qualcomm.com
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: Checkpatch warning of qcom ath12k wifi node
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eozKv-XDHfSCo_J9m3n3kDUjvERoo7uj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfX5SEOryoNI44B
 dGLjaqnuJJ/jqpQwE9ESKK07kgxI2RVRaLtzx6VZlbgSFAJU6kKVL2m3bPzdlCNLv7qF/kwh5cb
 +uXSTdMyC/WDW03BKPRzuxnWE8HJ9oiefDd/ON2H9prQVQ2pmFqZmmLHb/kbNgADRnN/2tBSAaG
 OVGJ2oIcZII+xuVzCSfc5AgJI6W7PwQIzMLgr9U4iWORIzlEggXKaZWfzWWqcolBvzlKv0XP2CF
 gL0wyIJ+F2kKMXicH+eHGcZn3HR24OjcOR6Megf6HZfMOsfWA/tXqFpOF9TWtW2AkOoGYNm9aEE
 +fL0dUt5dS+0m/DftUAbM40+tDp7LRCjf9UKL7yrReWE0nv2gqo9DLC7Ik+ifKk6v32VPLRd6qR
 +r0SfArEwtdV+4J6WBulAiYN5hIfOA==
X-Proofpoint-GUID: eozKv-XDHfSCo_J9m3n3kDUjvERoo7uj
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938ee27 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=x8NPreKCXEkmtoi0VuwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_195104_221017_25C66ABF 
X-CRM114-Status: UNSURE (   6.94  )
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

Hi Andy and Joe,


I met a Checkpatch warning issue for ath12k wifi node:


./scripts/checkpatch.pl arch/arm64/boot/dts/qcom/sm8750-mtp.dts
WARNING: DT compatible string vendor "pci17cb" appears un-documented -- 
check ./Documentation/devicetree/bindings/vendor-prefixes.yaml#1026: 
FILE: arch/arm64/boot/dts/qcom/sm8750-mtp.dts:1026:
+               compatible = "pci17cb,1107";

total: 0 errors, 1 warnings, 1275 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

arch/arm64/boot/dts/qcom/sm8750-mtp.dts has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.


All dts files which contain (compatible = "pci17cb,1107"; ) met this 
warning. But in fact this DT compatible string is already defined in  
devicetree/bindings/net/wireless/qcom,ath12k.yaml

I raised a new change review 
https://lore.kernel.org/all/20251210032817.1264850-1-yingying.tang@oss.qualcomm.com, 
it also met this issue.


Could please help to resolve this issue, thanks very much


